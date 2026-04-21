# Roadmap de Evolución — Rutas Verdes

**Fecha:** Abril 2026
**Proyecto:** Rutas Verdes — Aplicación Móvil Flutter
**Autor:** Senior Technical Lead

---

## 1. Visión Estratégica

El proyecto "Rutas Verdes" tiene un gran potencial como herramienta de exploración y documentación de la naturaleza. Para elevarlo de un prototipo básico a una aplicación profesional y competitiva, es necesario implementar funcionalidades que aporten valor real al usuario, fomenten la retención y aprovechen las capacidades nativas del dispositivo.

A continuación, se proponen 3 funcionalidades de alto impacto, justificadas desde la perspectiva técnica y de experiencia de usuario (UX).

---

## 2. Funcionalidad 1: Identificación Botánica y Faunística con IA (Computer Vision)

### 2.1. Descripción
Integrar un modelo de Machine Learning (como TensorFlow Lite o una API en la nube como Google Cloud Vision / PlantNet) que permita a los usuarios tomar una foto de una planta, insecto o animal desde la aplicación y recibir una identificación automática de la especie, junto con información relevante (nombre científico, hábitat, nivel de conservación).

### 2.2. Justificación de Usuario (UX)
El núcleo de "Rutas Verdes" es la exploración. Actualmente, los usuarios pueden tomar fotos y guardarlas en álbumes, pero carecen de contexto sobre lo que están observando. La identificación automática transforma la aplicación de una simple galería de fotos a una **herramienta educativa interactiva**, aumentando drásticamente el "Aha! moment" y la retención del usuario.

### 2.3. Justificación Técnica
- **Viabilidad:** Flutter soporta integración nativa con modelos de ML a través de paquetes como `tflite_flutter` o `google_ml_kit`.
- **Arquitectura:** Permite implementar un patrón de repositorio robusto donde la imagen se procesa localmente (para modo offline) o se envía a una API (para mayor precisión).
- **Monetización:** Esta característica premium es ideal para un modelo freemium (ej. 5 identificaciones gratuitas al día, ilimitadas con suscripción).

---

## 3. Funcionalidad 2: Geolocalización y Mapeo de Rutas Offline (Tracking)

### 3.1. Descripción
Implementar un sistema de tracking GPS que registre el recorrido del usuario en tiempo real sobre un mapa interactivo. Los usuarios podrán guardar sus "Rutas Verdes", añadir marcadores (waypoints) donde encontraron especies interesantes, y descargar mapas para uso sin conexión a internet.

### 3.2. Justificación de Usuario (UX)
La exploración en la naturaleza frecuentemente ocurre en áreas con baja o nula cobertura de red. Una aplicación de rutas que no funciona offline pierde su utilidad principal. Permitir a los usuarios grabar sus recorridos y ver dónde tomaron cada foto crea un **diario de viaje geoespacial** altamente personal y compartible.

### 3.3. Justificación Técnica
- **Viabilidad:** Utilización de paquetes maduros como `flutter_map` (basado en Leaflet) o `google_maps_flutter`, combinados con `geolocator` para el tracking en background.
- **Persistencia:** Requiere implementar una base de datos local robusta (como Isar, Hive o SQLite/sqflite) para almacenar las coordenadas GPS (GeoJSON) y los tiles del mapa para uso offline.
- **Performance:** El tracking en background exige un manejo cuidadoso del ciclo de vida de la aplicación y optimización del consumo de batería, elevando el estándar técnico del proyecto.

---

## 4. Funcionalidad 3: Gamificación y Comunidad (Social Eco-Network)

### 4.1. Descripción
Crear un ecosistema social donde los usuarios puedan compartir sus rutas y descubrimientos. Implementar un sistema de logros (ej. "Botánico Novato", "Explorador Nocturno") basados en la cantidad y rareza de las especies identificadas o kilómetros recorridos. Incluir un feed de comunidad para ver los descubrimientos de otros usuarios cercanos.

### 4.2. Justificación de Usuario (UX)
La gamificación introduce motivadores extrínsecos que fomentan el uso recurrente de la aplicación. El componente social transforma la experiencia individual en una **actividad comunitaria**, permitiendo a los usuarios validar sus descubrimientos, competir amistosamente y descubrir nuevas rutas recomendadas por locales.

### 4.3. Justificación Técnica
- **Viabilidad:** Requiere la implementación de un backend escalable (como Supabase o Firebase) para manejar perfiles de usuario, relaciones (seguidores/seguidos), feeds en tiempo real y almacenamiento de imágenes en la nube (Storage).
- **Arquitectura:** Exige un diseño de base de datos relacional eficiente y la implementación de paginación/infinite scrolling en la UI de Flutter para manejar grandes volúmenes de datos sin degradar el rendimiento.
- **Seguridad:** Introduce la necesidad de implementar reglas de seguridad a nivel de base de datos (Row Level Security) para proteger la privacidad de las ubicaciones de los usuarios.

---

## 5. Fases de Implementación Sugeridas

1.  **Fase 1 (Estabilización):** Refactorización arquitectónica (Clean Architecture), implementación de Supabase Auth y corrección de deuda técnica actual.
2.  **Fase 2 (Core Value):** Integración de la cámara con el modelo de identificación por IA (Funcionalidad 1).
3.  **Fase 3 (Expansión):** Desarrollo del módulo de mapas y tracking offline (Funcionalidad 2).
4.  **Fase 4 (Retención):** Lanzamiento de perfiles públicos, feed social y sistema de logros (Funcionalidad 3).
