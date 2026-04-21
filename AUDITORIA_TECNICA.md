# Auditoría Técnica Integral — Rutas Verdes

**Fecha:** Abril 2026
**Proyecto:** Rutas Verdes — Aplicación Móvil Flutter
**Auditor:** Senior Technical Lead & Software Auditor
**Referencia de Estilo:** Fundación Reiki Intranet (Technology of Jota)

---

## 1. Resumen Ejecutivo

Se ha realizado una revisión exhaustiva del repositorio `Rutas-Verdes`, una aplicación móvil desarrollada con **Flutter/Dart** en el año 2024. El proyecto representa un prototipo funcional de una aplicación de exploración de rutas naturales con módulos de autenticación, álbumes fotográficos, cámara y perfil de usuario. Si bien el código refleja el aprendizaje inicial del desarrollador, se han identificado **deficiencias estructurales críticas** que comprometen la mantenibilidad, la seguridad y la escalabilidad del sistema a largo plazo.

El análisis cubre la totalidad del código fuente disponible: 4 archivos Dart en la rama `main` y 7 archivos Dart adicionales en la rama `master` (que contiene las funcionalidades más avanzadas), el archivo de configuración `pubspec.yaml`, el `AndroidManifest.xml` y el historial de commits.

**Veredicto general:** El proyecto se encuentra en estado de **prototipo no productivo**. Requiere una refactorización integral antes de cualquier despliegue en entornos de producción o publicación en tiendas de aplicaciones.

---

## 2. Inventario del Proyecto

| Elemento | Detalle |
| :--- | :--- |
| **Framework** | Flutter 3.18+ / Dart SDK >=3.4.3 |
| **Plataformas objetivo** | Android, iOS, Web, Linux, macOS, Windows |
| **Dependencias directas** | `cupertino_icons ^1.0.6`, `salomon_bottom_bar ^3.3.2`, `image_picker` (solo en rama master) |
| **Archivos Dart (main)** | 4 archivos (`main.dart`, `navegacion.dart`, `registro.dart`, `recuperarcontasena.dart`) |
| **Archivos Dart (master)** | +4 archivos (`menu.dart`, `albumes.dart`, `camara.dart`, `perfilPersonal.dart`) |
| **Cobertura de tests** | 0% (el único test existente es el boilerplate de Flutter, completamente desactualizado) |
| **Commits totales** | 4 commits (todos en el mismo día: 13 de junio de 2024) |
| **Ramas activas** | `main` (rama por defecto) y `master` (con más funcionalidades, sin fusionar) |

---

## 3. Hallazgos de Calidad de Código

### 3.1. Violaciones de Nomenclatura y Convenciones Dart (Crítico)

**Descripción:** Dart y Flutter establecen convenciones de nomenclatura estrictas en sus guías de estilo oficiales (`dart.dev/guides/language/effective-dart`). El proyecto viola sistemáticamente estas convenciones en múltiples niveles.

**Evidencia concreta:**

```dart
// INCORRECTO — Funciones de nivel superior con nombre en PascalCase (reservado para clases)
Widget Titulo() { ... }
Widget campoUsuario() { ... }  // Mezcla inconsistente

// INCORRECTO — Clase con nombre en minúsculas (violación de UpperCamelCase para clases)
class registro extends StatelessWidget { ... }

// INCORRECTO — Archivo con nombre inconsistente
// recuperarcontasena.dart (falta la 'ñ', nombre en español sin estructura)
```

**Impacto:** La inconsistencia en la nomenclatura dificulta la lectura del código, confunde a los linters y genera advertencias que el desarrollador suprime con directivas `// ignore_for_file`, enmascarando problemas reales.

**Recomendación:** Aplicar `UpperCamelCase` para clases y widgets, `lowerCamelCase` para funciones y variables, y `snake_case` para nombres de archivos. Eliminar todas las directivas `ignore_for_file` y resolver las advertencias subyacentes.

---

### 3.2. Widgets como Funciones de Nivel Superior (Anti-Pattern Crítico)

**Descripción:** El patrón más grave identificado en el proyecto es la definición de widgets como funciones libres en lugar de clases que extienden `StatelessWidget` o `StatefulWidget`. Este es uno de los anti-patrones más documentados en Flutter.

**Evidencia concreta:**

```dart
// ANTI-PATTERN — Widget como función libre (main.dart)
Widget campoUsuario() {
  return Container(
    child: TextField(...),
  );
}

Widget campoContrasena() { ... }
Widget botonIniciarSesion(BuildContext context) { ... }
Widget botonRegistro(BuildContext context) { ... }
// Este patrón se repite en TODOS los archivos del proyecto
```

**Impacto técnico:**
- El motor de renderizado de Flutter no puede optimizar la reconstrucción del árbol de widgets. Cada vez que el widget padre se reconstruye, todas las funciones se re-ejecutan completamente, generando renders innecesarios.
- No es posible usar `const` constructors, lo que impide la optimización de memoria.
- No se puede implementar `Key` para preservar el estado del widget.
- El `DevTools` de Flutter no puede inspeccionar estos "widgets" individualmente en el árbol de componentes.

**Recomendación:** Convertir cada función widget en una clase `StatelessWidget` o `StatefulWidget` independiente, con su propio constructor tipado.

```dart
// CORRECTO — Widget como clase
class CampoUsuario extends StatelessWidget {
  const CampoUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(...),
    );
  }
}
```

---

### 3.3. Ausencia Total de Gestión de Estado (Crítico)

**Descripción:** Los campos de texto (`TextField`) en los formularios de login, registro y recuperación de contraseña no tienen ningún `TextEditingController` asociado. Esto significa que **es imposible leer el valor ingresado por el usuario** en ninguno de los formularios.

**Evidencia concreta:**

```dart
// main.dart — El campo de usuario no tiene controller
Widget campoUsuario() {
  return Container(
    child: TextField(
      decoration: InputDecoration(hintText: "Nombre de usuario"),
      // SIN TextEditingController — el valor es inaccesible
    ),
  );
}

// El botón de login navega directamente sin validar ni leer ningún campo
Widget botonIniciarSesion(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Navegacion()));
      // No hay autenticación real, cualquier pulsación navega
    },
    ...
  );
}
```

**Impacto:** La aplicación no tiene autenticación funcional. El botón "Iniciar Sesión" navega incondicionalmente a la pantalla principal sin verificar ninguna credencial. El formulario de registro tampoco persiste ningún dato.

**Recomendación:** Implementar `TextEditingController` para cada campo, integrar un gestor de estado (mínimo `StatefulWidget` con `setState`, idealmente `Riverpod` o `Bloc`) y conectar la lógica de autenticación a un backend como Firebase Auth o Supabase.

---

### 3.4. Supresión Masiva de Advertencias del Linter (Alto)

**Descripción:** Todos los archivos del proyecto contienen directivas `// ignore_for_file` al inicio, suprimiendo advertencias del analizador estático en lugar de resolverlas.

**Evidencia concreta:**

```dart
// main.dart
// ignore_for_file: prefer_const_constructors, avoid_print

// registro.dart
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

// recuperarcontasena.dart
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types
```

**Impacto:** Suprimir `camel_case_types` oculta el hecho de que la clase `registro` viola las convenciones de nomenclatura. Suprimir `prefer_const_constructors` impide las optimizaciones de rendimiento que Flutter realiza con widgets `const`.

**Recomendación:** Eliminar todas las directivas `ignore_for_file` y resolver cada advertencia individualmente. Configurar un `analysis_options.yaml` más estricto con reglas adicionales de `flutter_lints`.

---

### 3.5. Deuda Técnica en la Gestión de Ramas Git (Alto)

**Descripción:** El repositorio tiene dos ramas activas (`main` y `master`) con código divergente. La rama `master` contiene funcionalidades más completas (menú principal, álbumes, cámara funcional, perfil) que **nunca fueron fusionadas** a `main`. La rama `main` tiene un estado regresivo del código.

**Evidencia del historial de commits:**

| Hash | Fecha | Mensaje |
| :--- | :--- | :--- |
| `c6ddd53` | 2024-06-13 22:53 | Agregamos el menu perfil, Menu principal, Camara funcional, y albumes |
| `602f11b` | 2024-06-13 00:48 | volvi a dejar como estaba la linea 53 |
| `bfa196f` | 2024-06-13 00:46 | modifique la linea 53 |
| `49058c7` | 2024-06-13 00:27 | interfaz de login |

Los mensajes de commit son informales, en español coloquial y sin convención alguna (no siguen `Conventional Commits` ni ningún estándar). Los 4 commits se realizaron en el mismo día, lo que indica una sesión de trabajo única sin planificación de ramas.

**Recomendación:** Fusionar `master` en `main`, eliminar la rama redundante, y adoptar `Conventional Commits` (`feat:`, `fix:`, `refactor:`, `docs:`, `chore:`).

---

### 3.6. Ausencia de Arquitectura (Crítico)

**Descripción:** El proyecto no sigue ningún patrón arquitectónico reconocido. Todo el código (lógica de negocio, lógica de UI, constantes de estilo) está mezclado en los mismos archivos sin separación de responsabilidades.

**Estructura actual (problemática):**

```
lib/
├── main.dart          ← Punto de entrada + Pantalla de Login + 6 widgets funcionales
└── pages/
    ├── navegacion.dart
    ├── registro.dart
    └── recuperarcontasena.dart
```

**Estructura recomendada (Clean Architecture para Flutter):**

```
lib/
├── main.dart
├── core/
│   ├── constants/        ← Colores, strings, dimensiones
│   ├── theme/            ← AppTheme
│   └── router/           ← GoRouter o AutoRoute
├── features/
│   ├── auth/
│   │   ├── data/         ← Repositorios, datasources
│   │   ├── domain/       ← Entidades, casos de uso
│   │   └── presentation/ ← Widgets, pantallas, providers
│   ├── rutas/
│   ├── albumes/
│   └── perfil/
└── shared/
    ├── widgets/          ← Widgets reutilizables
    └── utils/
```

---

### 3.7. Código Muerto y Funcionalidades Incompletas (Medio)

**Descripción:** Se identificaron múltiples instancias de código incompleto o no funcional que fueron dejadas en el repositorio.

**Evidencia concreta:**

```dart
// registro.dart — El botón de registro no hace nada útil
Widget botonEntrar() {
  return TextButton(
    onPressed: () => {
      print("Presionaste el botón")  // Código de depuración en producción
    },
    ...
  );
}

// perfilPersonal.dart (master) — Imagen de perfil hardcodeada con asset inexistente
backgroundImage: AssetImage('assets/images/profile.jpg'),
// Este asset no existe en el proyecto, causará un error en runtime

// albumes.dart (master) — URLs de imágenes hardcodeadas de dominios externos
imageUrl: 'https://www.cdbp.gob.cl/sites/...',
// Dependencia de URLs externas sin control de disponibilidad
```

**Impacto:** El `print()` en producción puede exponer información sensible en logs. El `AssetImage` con ruta inexistente lanzará una excepción en runtime. Las URLs hardcodeadas de imágenes externas son un punto de falla fuera del control del desarrollador.

---

## 4. Hallazgos de Seguridad

### 4.1. Autenticación Simulada — Bypass Total (Crítico)

**Descripción:** El flujo de autenticación es completamente ficticio. El botón "Iniciar Sesión" navega a la pantalla principal sin ninguna verificación de credenciales.

```dart
// main.dart — Navegación incondicional, sin autenticación
Widget botonIniciarSesion(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Navegacion()));
    },
    ...
  );
}
```

**Impacto:** Si esta aplicación se desplegara tal como está, cualquier usuario podría acceder a todas las funcionalidades sin credenciales válidas. No existe ninguna capa de protección.

**Recomendación:** Integrar un servicio de autenticación real (Firebase Auth, Supabase Auth o un backend propio con JWT). Implementar guards de navegación que verifiquen el estado de autenticación antes de permitir el acceso a rutas protegidas.

---

### 4.2. Ausencia de Permisos de Cámara en AndroidManifest (Alto)

**Descripción:** La funcionalidad de cámara (`CamaraPage` en rama `master`) utiliza el paquete `image_picker` para acceder a la cámara del dispositivo. Sin embargo, el `AndroidManifest.xml` no declara los permisos necesarios.

**Permisos faltantes en `AndroidManifest.xml`:**

```xml
<!-- FALTANTES — Necesarios para image_picker en Android -->
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```

**Impacto:** La aplicación lanzará una excepción en runtime al intentar abrir la cámara en Android. En iOS, faltaría también la clave `NSCameraUsageDescription` en `Info.plist`.

---

### 4.3. Imagen de Fondo Cargada desde URL Externa sin Fallback (Medio)

**Descripción:** La pantalla de login carga una imagen de fondo directamente desde Pinterest mediante `NetworkImage`, sin ningún manejo de error ni imagen de respaldo.

```dart
// main.dart
image: DecorationImage(
  image: NetworkImage(
    "https://i.pinimg.com/564x/ac/84/df/ac84dfc6125f5db46dac13bb3e5a0570.jpg"
  ),
  fit: BoxFit.cover
),
```

**Impacto:** Si la URL de Pinterest no está disponible (por políticas de CORS, rate limiting o cambios en la URL), la pantalla de login se mostrará sin fondo, con una experiencia visual degradada. Adicionalmente, usar imágenes de Pinterest en producción puede violar sus términos de servicio.

**Recomendación:** Incluir la imagen como asset local en el proyecto (`assets/images/`) y referenciarla con `AssetImage`.

---

### 4.4. Application ID de Ejemplo en Producción (Medio)

**Descripción:** El `applicationId` en `android/app/build.gradle` sigue siendo el valor por defecto generado por Flutter.

```groovy
// build.gradle
applicationId = "com.example.rutasverdes"
```

**Impacto:** Publicar una aplicación con `com.example.*` en Google Play Store es rechazado automáticamente. Además, el namespace genérico puede causar conflictos con otras aplicaciones de ejemplo.

---

## 5. Hallazgos de Performance

### 5.1. Reconstrucciones Innecesarias del Árbol de Widgets (Alto)

**Descripción:** Como consecuencia directa del anti-pattern de widgets como funciones (sección 3.2), el motor de renderizado de Flutter no puede optimizar las reconstrucciones. Todos los widgets de la pantalla se reconstruyen en cada `setState`, incluso aquellos que no han cambiado.

**Impacto:** En pantallas con múltiples elementos (como el formulario de registro con 5 campos), cada interacción del usuario desencadena la reconstrucción completa de todos los widgets de la pantalla.

---

### 5.2. Ausencia de `const` en Constructores (Medio)

**Descripción:** Ningún widget del proyecto utiliza el modificador `const` en sus constructores, a pesar de que la mayoría son completamente estáticos. La directiva `// ignore_for_file: prefer_const_constructors` suprime activamente esta advertencia.

**Impacto:** Flutter no puede cachear estos widgets en memoria entre reconstrucciones, aumentando el consumo de memoria y el tiempo de renderizado.

---

### 5.3. Carga de Imágenes sin Caché (Medio)

**Descripción:** Las imágenes en `albumes.dart` (rama master) se cargan con `NetworkImage` sin ningún mecanismo de caché. Cada vez que el usuario navega a la pantalla de álbumes, todas las imágenes se descargan nuevamente.

**Recomendación:** Utilizar el paquete `cached_network_image` para implementar caché automático de imágenes de red.

---

## 6. Matriz de Priorización de Hallazgos

| # | Hallazgo | Severidad | Esfuerzo | Prioridad |
| :--- | :--- | :---: | :---: | :---: |
| 3.3 | Ausencia de gestión de estado en formularios | Crítico | Alto | P0 |
| 4.1 | Autenticación simulada (bypass total) | Crítico | Alto | P0 |
| 3.2 | Widgets como funciones de nivel superior | Crítico | Medio | P1 |
| 3.6 | Ausencia de arquitectura (Clean Architecture) | Crítico | Alto | P1 |
| 3.5 | Divergencia de ramas Git sin fusionar | Alto | Bajo | P1 |
| 4.2 | Permisos de cámara faltantes en AndroidManifest | Alto | Bajo | P1 |
| 3.1 | Violaciones de nomenclatura Dart | Alto | Medio | P2 |
| 3.4 | Supresión masiva de advertencias del linter | Alto | Medio | P2 |
| 5.1 | Reconstrucciones innecesarias del árbol | Alto | Medio | P2 |
| 3.7 | Código muerto y funcionalidades incompletas | Medio | Bajo | P2 |
| 4.3 | Imagen de fondo desde URL externa sin fallback | Medio | Bajo | P3 |
| 4.4 | Application ID genérico de ejemplo | Medio | Bajo | P3 |
| 5.2 | Ausencia de `const` en constructores | Medio | Bajo | P3 |
| 5.3 | Carga de imágenes sin caché | Medio | Bajo | P3 |

---

## 7. Componentes que Deben Reescribirse

Los siguientes módulos requieren reescritura completa (no refactorización incremental) debido a la profundidad de sus deficiencias estructurales:

**`lib/main.dart`** — Debe dividirse en tres responsabilidades separadas: el punto de entrada de la aplicación (`main()`), la configuración del `MaterialApp` con tema y router, y la pantalla de login como un widget de clase independiente con su propio `ViewModel` o `Provider`.

**`lib/pages/registro.dart`** — Debe reescribirse como un `StatefulWidget` con `TextEditingController` para cada campo, validación de formulario con `Form` y `FormField`, y conexión a un servicio de autenticación real.

**`lib/pages/navegacion.dart`** — La navegación debe migrarse a `GoRouter` o `AutoRoute` para soportar deep linking, navegación declarativa y guards de autenticación. El `SalomonBottomBar` puede mantenerse como componente visual.

**`lib/pages/recuperarcontasena.dart`** — Debe reescribirse con el flujo completo de recuperación (envío de email, confirmación) y corregir el error tipográfico en el nombre del archivo (`contasena` → `contrasena`).

---

## 8. Deuda Técnica Estimada

Basándose en el modelo de deuda técnica SQALE y la complejidad del proyecto actual, se estima la siguiente inversión para llevar el proyecto a estándares de producción:

| Categoría | Horas Estimadas |
| :--- | :---: |
| Refactorización de arquitectura (Clean Architecture) | 16–24 h |
| Implementación de autenticación real (Supabase/Firebase) | 8–12 h |
| Migración de widgets funcionales a clases | 4–6 h |
| Implementación de gestión de estado (Riverpod) | 8–12 h |
| Corrección de nomenclatura y linting | 2–4 h |
| Configuración de CI/CD y tests unitarios | 6–10 h |
| Corrección de permisos y configuración nativa | 2–3 h |
| **Total estimado** | **46–71 h** |

---

*Este reporte fue generado mediante análisis estático del código fuente. Se recomienda complementarlo con pruebas de integración y análisis dinámico una vez implementada la arquitectura propuesta.*
