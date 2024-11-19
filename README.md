# Flutter Movie App 🎥

## Descripción 📖
Esta aplicación es una prueba técnica desarrollada en **Flutter** que consume la API de [The Movie Database](https://api.themoviedb.org/3). La aplicación permite:

- Mostrar una lista de **categorías de películas** disponibles.
- **Buscar películas** por texto.
- Ver los **detalles** de una película seleccionada.

## Funcionalidades ✨
1. **Pantalla inicial**:
   - Se cargan categorías de películas disponibles desde la API.
2. **Búsqueda por texto**:
   - Permite buscar películas por su título u otros criterios definidos.
3. **Detalles de película**:
   - Al seleccionar una película, se muestra información detallada como:
      - Título
      - Sinopsis
      - Fecha de lanzamiento
      - Imagen del póster (entre otros).

## Tecnologías y herramientas 🛠️
- **Lenguaje**: Dart
- **Framework**: Flutter
- **IDE**: Android Studio
- **API**: The Movie Database ([Documentación oficial](https://developer.themoviedb.org/docs))
- **Paquetes utilizados**:
   - `dio` para las solicitudes REST
   - `flutter_dotenv` para manejar variables de entorno
   - `dartz` Manejo de errores, programación funcional
   - `get_it` Inyección de dependencias
   - `flutter_bloc` Manejo correcto y optimizado de los estados
   - `bloc_test` test para los providers

## Requisitos del sistema 🖥️
- **Flutter SDK**: >= 3.24.3
- **Dart SDK**: >= 3.5.3
- **Android Studio**: >= X.X.X

## Configuración 🔧
### Variables de entorno
La aplicación utiliza un archivo `.env` para almacenar las claves y URLs necesarias. Asegúrate de crear este archivo en la raíz del proyecto y agregar las siguientes variables:

```env
API_MOVIES_URL=https://api.themoviedb.org/3  
API_MOVIES_KEY=xxxxxxxxxx
API_MOVIES_LANGUAGE=es-ES  
API_IMAGES_URL=https://image.tmdb.org/t/p
```
### Pasos para configurar:

1.  **Clave de la API**:

   -   Obtén tu clave desde The Movie Database API. [Documentación oficial](https://developer.themoviedb.org/docs)

2.  **Ejecutar la aplicación**:

   -   Clona este repositorio:

       `git clone https://github.com/tuusuario/flutter-movie-app.git`

   -   Agrega tu clave y las otras variables en el archivo `.env` en la raiz del proyecto.

   -   Instala las dependencias:

       `flutter pub get`

   -   Ejecuta la aplicación:

       `flutter run`


## Arquitectura ⚙️

-   **Patrón utilizado**: `BLoC`
```lib/
├── config/
│   ├── constants/
│   │   └── themes/
│   │       ├── data/
│   │       │   ├── AppTheme.dart
│   │       │   ├── CustomColors.dart
│   │       │   └── ThemesColors.dart
│   │       └── presentation/
│   │           ├── theme_bloc.dart
│   │           └── theme_event.dart
│   └── environment.dart
├── core/
│   └── error/
│       └── failures.dart
├── features/
│   └── movies/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── use_cases/
│       └── presentation/
│           ├── bloc/
│           │   ├── get_credits/
│           │   ├── get_details/
│           │   ├── get_movies_type/
│           │   └── search_movies/
│           ├── screens/
│           └── widgets/
├── di.dart
└── main.dart
``` 

----------

### Descripción de los Módulos

1.  **`config/`**  
    Contiene configuraciones globales y constantes utilizadas en la aplicación:

   -   **`constants/`**: Define temas, colores y configuraciones temáticas.
      -   **`data/`**: Contiene la definición de temas personalizados y colores para la aplicación.
      -   **`presentation/`**: Implementa la lógica de gestión del tema (Bloc y eventos). Especificamente Tema Oscuro y Tema Claro
   -   **`environment.dart`**: Define configuraciones específicas del entorno, como URL de APIs, claves de acceso, etc.
2.  **`core/`**  
    Contiene componentes reutilizables y utilidades que no dependen de una característica específica:

   -   **`error/failures.dart`**: Define clases para manejar errores comunes en el proyecto, siguiendo la convención de resultados tipo éxito o fallo.
3.  **`features/`**  
    El núcleo de la aplicación está organizado en **features**. En este caso, el feature principal es `movies/`, que contiene toda la lógica y estructura relacionada con la funcionalidad de películas:

   -   **`data/`**
      -   **`datasources/`**: Contiene las fuentes de datos (por ejemplo, APIs o bases de datos locales).
      -   **`models/`**: Define modelos que mapean datos desde y hacia las fuentes de datos.
      -   **`repositories/`**: Implementaciones concretas de repositorios que obtienen y manipulan datos.
   -   **`domain/`**
      -   **`entities/`**: Define entidades puras que representan los modelos de negocio.
      -   **`repositories/`**: Define interfaces para los repositorios utilizados en la capa de dominio.
      -   **`use_cases/`**: Implementa casos de uso específicos, encapsulando la lógica de negocio.
   -   **`presentation/`**
      -   **`bloc/`**: Contiene la lógica de estado para la UI, organizada en carpetas según funcionalidades específicas:
         -   `get_credits/`, `get_details/`, `get_movies_type/`, `search_movies/`: Manejan diferentes funcionalidades relacionadas con la gestión de películas.
      -   **`screens/`**: Contiene las pantallas principales de la aplicación.
      -   **`widgets/`**: Incluye componentes de UI reutilizables.
4.  **`di.dart`**  
    Contiene la configuración de **inyección de dependencias**, donde se registran servicios, repositorios y otros objetos necesarios.

5.  **`main.dart`**  
    Punto de entrada de la aplicación. Configura el tema, las rutas principales y el entorno inicial.

## Pruebas 🧪

-   **Pruebas unitarias**: Añade detalles sobre los tests implementados.
-   Para ejecutar las pruebas:

    `flutter test`


## Capturas de pantalla 📸

1.  Pantalla inicial:
    <br>
    <img src="https://firebasestorage.googleapis.com/v0/b/diario-54ed0.appspot.com/o/imagenes%2FSimulator%20Screenshot%20-%20iPhone%2016%20-%202024-11-18%20at%2018.51.11.png?alt=media" width="300" />
    <img src="https://firebasestorage.googleapis.com/v0/b/diario-54ed0.appspot.com/o/imagenes%2FSimulator%20Screenshot%20-%20iPhone%2016%20-%202024-11-18%20at%2018.51.14.png?alt=media" width="300" />
    <img src="https://firebasestorage.googleapis.com/v0/b/diario-54ed0.appspot.com/o/imagenes%2FSimulator%20Screenshot%20-%20iPhone%2016%20-%202024-11-18%20at%2018.51.19.png?alt=media" width="300" />


2.  Detalles de película:
    <br>
    <img src="https://firebasestorage.googleapis.com/v0/b/diario-54ed0.appspot.com/o/imagenes%2FSimulator%20Screenshot%20-%20iPhone%2016%20-%202024-11-18%20at%2018.51.22.png?alt=media" width="300" />
    <img src="https://firebasestorage.googleapis.com/v0/b/diario-54ed0.appspot.com/o/imagenes%2FSimulator%20Screenshot%20-%20iPhone%2016%20-%202024-11-18%20at%2018.52.11.png?alt=media" width="300" />



## Créditos 👨‍💻

-   **Desarrollador**: [David Stiven Rodríguez Taborda](https://github.com/davidrotabor)
