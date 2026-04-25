# Rutas Verdes App

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![Supabase](https://img.shields.io/badge/Supabase-PostgreSQL-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)](https://supabase.com/)
[![Riverpod](https://img.shields.io/badge/Riverpod-State_Management-00B0FF?style=for-the-badge&logo=riverpod&logoColor=white)](https://riverpod.dev/)

## Visión General (Overview)

**Rutas Verdes App** es una solución móvil innovadora diseñada para fomentar la exploración de la naturaleza y la documentación de la biodiversidad. Esta plataforma ofrece a los usuarios herramientas para la captura fotográfica, gestión de álbumes botánicos y faunísticos, y perfiles de usuario, garantizando una experiencia inmersiva y educativa. Su impacto radica en democratizar la documentación ambiental, permitiendo a entusiastas y científicos ciudadanos contribuir a la conservación y el estudio de la flora y fauna local, a la vez que promueve la interacción con el entorno natural.

## Características Clave (Key Features)

*   **Gestión de Identidad y Perfiles**: Sistema de autenticación seguro (proyectado con Supabase) que permite a los usuarios crear perfiles personalizados, gestionar sus credenciales y visualizar estadísticas de exploración.
*   **Captura y Documentación**: Integración nativa con la cámara del dispositivo para capturar especímenes en tiempo real, facilitando la documentación inmediata durante las rutas.
*   **Organización Taxonómica**: Módulos dedicados para la creación y gestión de álbumes temáticos (Plantas, Animales, Insectos), permitiendo una clasificación estructurada de los descubrimientos.
*   **Navegación Intuitiva**: Implementación de un sistema de navegación inferior (`SalomonBottomBar`) que proporciona acceso rápido y ergonómico a las secciones principales de la aplicación.
*   **Diseño Responsivo y UX Mejorada**: Interfaz de usuario optimizada para diversos tamaños de pantalla móviles, con retroalimentación visual y gradientes temáticos que refuerzan la identidad "verde" de la aplicación.
*   **Tecnologías Modernas**: Aprovecha las capacidades multiplataforma de Flutter y el tipado estricto de Dart para un código robusto y mantenible.

## Arquitectura y Tecnologías

La aplicación `Rutas Verdes` está construida como una plataforma móvil multiplataforma utilizando **Flutter** y **Dart**, lo que garantiza un rendimiento nativo y una interfaz de usuario fluida tanto en Android como en iOS desde una única base de código. La arquitectura está diseñada bajo los principios de **Clean Architecture** para asegurar la separación de responsabilidades, la testabilidad y la escalabilidad a largo plazo. La integración con **Supabase** (proyectada) proporcionará una base de datos PostgreSQL robusta y servicios de autenticación seguros.

*   **Framework Móvil**: Flutter, el UI toolkit de Google para crear aplicaciones compiladas nativamente desde una única base de código.
*   **Lenguaje de Programación**: Dart, un lenguaje optimizado para UI, con tipado estático y compilación AOT (Ahead-Of-Time) para alto rendimiento.
*   **Base de Datos & Auth**: Supabase (Proyectado), una plataforma de código abierto para bases de datos PostgreSQL y servicios de autenticación.
*   **Gestión de Estado**: Riverpod (Proyectado), un framework reactivo de caché y enlace de datos para Flutter, garantizando un estado predecible y fácil de probar.
*   **Navegación**: GoRouter (Proyectado), un enrutador declarativo para Flutter que soporta deep linking y guards de autenticación.

Esta combinación tecnológica permite el desarrollo ágil de una aplicación móvil rica en funcionalidades, con una excelente experiencia de usuario y una base sólida para futuras expansiones y contribuciones de la comunidad.

## Requisitos Previos (Prerequisites)

Para configurar y ejecutar el proyecto en un entorno de desarrollo local, asegúrese de tener instalados los siguientes componentes:

*   **Git**: Sistema de control de versiones.
    ```bash
    # Verificar instalación
    git --version
    ```
*   **Flutter SDK**: Versión 3.x o superior. Incluye Dart SDK.
    ```bash
    # Verificar instalación
    flutter --version
    ```
*   **IDE (Android Studio o VS Code)**: Con los plugins de Flutter y Dart instalados.
*   **Dispositivo o Emulador**: Un dispositivo Android/iOS físico o un emulador configurado para ejecutar aplicaciones Flutter.

## Guía de Instalación Rápida (Getting Started)

Siga estos pasos para levantar el entorno de desarrollo local:

1.  **Clonar el Repositorio**:
    ```bash
    git clone https://github.com/Juan-David-Idarraga/Rutas-Verdes.git
    cd Rutas-Verdes
    ```

2.  **Instalar Dependencias**:
    ```bash
    flutter pub get
    ```

3.  **Configurar Supabase (Proyectado)**:
    *   Cree un nuevo proyecto en [Supabase](https://supabase.com/).
    *   Obtenga su `SUPABASE_URL` y `SUPABASE_ANON_KEY`.
    *   Cree un archivo `.env` en la raíz del proyecto y configure las variables de entorno como se muestra en la sección siguiente.

4.  **Ejecutar la Aplicación**:
    *   Conecte un dispositivo físico o inicie un emulador.
    *   Ejecute la aplicación desde su IDE o usando el siguiente comando:
    ```bash
    flutter run
    ```

## Variables de Entorno (Environment Variables)

Cree un archivo `.env` en la raíz de su proyecto con las siguientes variables (requeridas una vez que la integración con Supabase esté completa):

```ini
# Supabase Configuration
SUPABASE_URL=your_supabase_project_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

## Despliegue (Deployment)

El despliegue de la aplicación móvil se realiza a través de las tiendas de aplicaciones correspondientes:

*   **Android (Google Play Store)**: Genere el App Bundle (`flutter build appbundle`), fírmelo con su keystore de producción y súbalo a la Google Play Console.
*   **iOS (Apple App Store)**: Genere el archivo IPA (`flutter build ipa`), configure los certificados y perfiles de aprovisionamiento en Xcode, y súbalo a App Store Connect a través de Transporter.

---

**Juan Idarraga**
*   **Empresa**: Technology of Jota
*   **Portafolio**: [LinkedIn Profile](https://www.linkedin.com/in/juan-david-idarraga-11088b387/)
