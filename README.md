# Rutas Verdes App

## Proyecto de Exploración y Documentación Natural

Este proyecto representa una solución móvil innovadora diseñada para fomentar la exploración de la naturaleza y la documentación de la biodiversidad. Desarrollada por **Technology of Jota** y liderada por **Juan Idarraga**, esta plataforma centraliza funcionalidades clave para la captura fotográfica, gestión de álbumes botánicos y faunísticos, y perfiles de usuario, garantizando una experiencia de usuario inmersiva y educativa.

## Visión General del Proyecto

La aplicación `Rutas Verdes` es una plataforma móvil multiplataforma construida con **Flutter**, ofreciendo un rendimiento nativo y una interfaz de usuario fluida tanto en Android como en iOS. La arquitectura proyectada integra **Supabase** para proporcionar una base de datos potente y servicios de autenticación seguros, mientras que el diseño visual se apoya en los principios de Material Design para asegurar una estética coherente y accesible.

## Características Clave

*   **Gestión de Identidad y Perfiles**: Sistema de autenticación seguro (proyectado con Supabase) que permite a los usuarios crear perfiles personalizados, gestionar sus credenciales y visualizar estadísticas de exploración.
*   **Captura y Documentación**: Integración nativa con la cámara del dispositivo para capturar especímenes en tiempo real, facilitando la documentación inmediata durante las rutas.
*   **Organización Taxonómica**: Módulos dedicados para la creación y gestión de álbumes temáticos (Plantas, Animales, Insectos), permitiendo una clasificación estructurada de los descubrimientos.
*   **Navegación Intuitiva**: Implementación de un sistema de navegación inferior (`SalomonBottomBar`) que proporciona acceso rápido y ergonómico a las secciones principales de la aplicación.
*   **Diseño Responsivo y UX Mejorada**: Interfaz de usuario optimizada para diversos tamaños de pantalla móviles, con retroalimentación visual y gradientes temáticos que refuerzan la identidad "verde" de la aplicación.
*   **Tecnologías Modernas**: Aprovecha las capacidades multiplataforma de Flutter y el tipado estricto de Dart para un código robusto y mantenible.

## Stack Tecnológico

| Categoría | Tecnología | Descripción |
| :--- | :--- | :--- |
| **Framework Móvil** | Flutter | UI toolkit de Google para crear aplicaciones compiladas nativamente desde una única base de código. |
| **Lenguaje de Programación** | Dart | Lenguaje optimizado para UI, con tipado estático y compilación AOT para alto rendimiento. |
| **Base de Datos & Auth** | Supabase (Proyectado) | Plataforma de código abierto para bases de datos PostgreSQL y servicios de autenticación. |
| **Gestión de Estado** | Riverpod (Proyectado) | Framework reactivo de caché y enlace de datos para Flutter, garantizando un estado predecible. |
| **Navegación** | GoRouter (Proyectado) | Enrutador declarativo para Flutter que soporta deep linking y guards de autenticación. |
| **Despliegue Backend** | Vercel / Supabase | Plataformas de despliegue continuo para servicios backend y base de datos. |

## Arquitectura del Sistema (Clean Architecture)

El proyecto está en proceso de migración hacia **Clean Architecture** para garantizar la separación de responsabilidades, la testabilidad y la escalabilidad a largo plazo.

1.  **Capa de Presentación (UI)**: Contiene los Widgets de Flutter y los State Notifiers (Riverpod). Es responsable únicamente de mostrar datos y capturar eventos del usuario.
2.  **Capa de Dominio (Domain)**: El núcleo de la aplicación. Contiene las Entidades (ej. `Especie`, `Ruta`, `Usuario`) y los Casos de Uso (ej. `GuardarCapturaUseCase`, `AutenticarUsuarioUseCase`). Es completamente independiente de Flutter o cualquier paquete externo.
3.  **Capa de Datos (Data)**: Implementa los repositorios definidos en el dominio. Contiene los Modelos (Data Transfer Objects) y los Data Sources (remotos vía Supabase API, o locales vía SQLite/Hive para modo offline).

## Flujo de Datos

1.  **Interacción del Usuario**: El usuario interactúa con la UI (ej. pulsa el botón de capturar foto).
2.  **Gestión de Estado**: El Widget notifica al Provider/Controller correspondiente sobre la acción.
3.  **Caso de Uso**: El Provider invoca el Caso de Uso en la capa de Dominio (`CapturarImagenUseCase`).
4.  **Repositorio**: El Caso de Uso solicita al Repositorio (capa de Datos) que ejecute la operación.
5.  **Data Source**: El Repositorio utiliza el Data Source local (cámara del dispositivo) para obtener la imagen, y el Data Source remoto (Supabase Storage) para subirla.
6.  **Respuesta**: El resultado fluye de vuelta a través de las capas hasta actualizar el estado, lo que desencadena una reconstrucción reactiva de la UI para mostrar la nueva foto en el álbum.

## Guía de Despliegue (Supabase & App Stores)

### 1. Configuración del Backend (Supabase)
1.  Crear un nuevo proyecto en el dashboard de Supabase.
2.  Configurar la autenticación (Email/Password y proveedores OAuth si se requiere).
3.  Ejecutar las migraciones SQL para crear las tablas `perfiles`, `albumes` y `capturas`, configurando Row Level Security (RLS) para que los usuarios solo accedan a sus propios datos.
4.  Crear un bucket público en Supabase Storage para las imágenes de los álbumes.

### 2. Configuración de la Aplicación (Flutter)
1.  Crear el archivo `.env` en la raíz del proyecto con las credenciales:
    ```env
    SUPABASE_URL=https://tu-proyecto.supabase.co
    SUPABASE_ANON_KEY=tu-anon-key
    ```
2.  Asegurar que el `applicationId` en `android/app/build.gradle` y el `Bundle Identifier` en iOS estén configurados correctamente (ej. `com.technologyofjota.rutasverdes`).

### 3. Despliegue a Tiendas
*   **Android (Google Play)**: Generar el App Bundle (`flutter build appbundle`), firmarlo con el keystore de producción y subirlo a la Google Play Console.
*   **iOS (App Store)**: Generar el archivo IPA (`flutter build ipa`), configurar los certificados y perfiles de aprovisionamiento en Xcode, y subirlo a App Store Connect vía Transporter.

## Estándares de Contribución

Para mantener la calidad y consistencia del código, todos los contribuidores deben adherirse a los siguientes estándares:

1.  **Convenciones de Nomenclatura**:
    *   Clases, Mixins, Enums y Typedefs: `UpperCamelCase` (ej. `PerfilUsuario`).
    *   Variables, Constantes, Funciones y Parámetros: `lowerCamelCase` (ej. `obtenerAlbumes()`).
    *   Archivos y Directorios: `snake_case` (ej. `perfil_usuario.dart`).
2.  **Gestión de Ramas (Git Flow)**:
    *   `main`: Rama de producción, siempre estable.
    *   `develop`: Rama de integración para la próxima versión.
    *   `feature/nombre-funcionalidad`: Ramas efímeras para nuevas características, creadas a partir de `develop`.
3.  **Commits (Conventional Commits)**:
    *   Usar prefijos estandarizados: `feat:` (nueva funcionalidad), `fix:` (corrección de bug), `refactor:` (cambio de código sin alterar comportamiento), `docs:` (documentación).
    *   Ejemplo: `feat: integrar cámara nativa para captura de especies`.
4.  **Calidad de Código**:
    *   Prohibido el uso de `// ignore_for_file` para suprimir advertencias del linter. Todas las advertencias deben resolverse.
    *   Todo Widget debe ser una clase (`StatelessWidget` o `StatefulWidget`), nunca una función que retorne un Widget.
    *   Utilizar constructores `const` siempre que sea posible para optimizar el rendimiento.

## Instalación y Configuración (Para Desarrollo Local)

Para ejecutar este proyecto localmente, sigue los siguientes pasos:

1.  **Clonar el Repositorio**:
    ```bash
    git clone https://github.com/Juan-David-Idarraga/rutas-verdes.git
    cd rutas-verdes
    ```
2.  **Instalar Dependencias**:
    ```bash
    flutter pub get
    ```
3.  **Ejecutar la Aplicación**:
    Conecta un dispositivo físico o inicia un emulador, y ejecuta:
    ```bash
    flutter run
    ```

## Autor y Empresa

Este proyecto ha sido desarrollado por:

**Juan Idarraga**
*   **Empresa**: Technology of Jota
*   **Portafolio**: https://www.linkedin.com/in/juan-david-idarraga-11088b387/

---
