# Flutter Meal App

This is a Flutter-based mobile application that utilizes the [TheMealDB API](https://themealdb.com/) to fetch and display meal recipes. The app is designed with modern UI components and leverages state management with Riverpod.

## Features
- Fetch and display meal recipes from TheMealDB API
- Caching images for better performance
- Smooth and responsive UI with Google Fonts
- Persistent local storage using GetStorage
- Open URLs directly from the app
- Modern icons with Iconsax

## Technologies & Dependencies
This project is built with Flutter and uses the following dependencies:

### Main Dependencies:
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  flutter_riverpod: ^2.6.1
  riverpod_annotation: ^2.6.1
  google_fonts: ^6.2.1
  dio: ^5.8.0+1
  cached_network_image: ^3.4.1
  url_launcher: ^6.3.1
  get_storage: ^2.1.1
  iconsax_plus: ^1.0.0
```

### Development Dependencies:
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
  riverpod_generator: ^2.6.3
  build_runner: ^2.4.13
  custom_lint: ^0.7.0
  riverpod_lint: ^2.6.3
```

## Getting Started
### Prerequisites
- Flutter installed ([Get Flutter](https://flutter.dev/docs/get-started/install))
- Dart installed

### Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/flutter-meal-app.git
   cd flutter-meal-app
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run the app:
   ```sh
   flutter run
   ```

## API Usage
This app retrieves data from [TheMealDB API](https://themealdb.com/). Ensure you check their documentation for API usage limits and available endpoints.

## Contribution
Feel free to contribute by submitting issues or pull requests. Follow standard coding guidelines and ensure to format code properly before submitting.

## License
This project is open-source and available under the [MIT License](LICENSE).
