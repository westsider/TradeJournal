# Trade Journal

A new Flutter project.

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.

### IMPORTANT:

For projects with Firestore integration, you must first run the following commands to ensure the project compiles:

```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

This command creates the generated files that parse each Record from Firestore into a schema object.

### Getting started continued:

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Trerminal commands
flutter create myapp, flutter --version, flutter emulators, flutter devices
flutter run -d emulator-5554, hot reload r, hot restart R
flutter run -d emulator-5554 -debug
flutter logs, brew install java, which java  

flutter clean, Pub: Get Packages, Pub: Upgrade Packages, flutter doctor
Flutter: Upgrade Packages, Flutter: Get Packages, Dart: Rerun Last Debug Session
path: from root dir open -e .zshrc
stlss -> statelestt widget
To run an emulator, run flutter emulators --launch Pixel XL API 31

flutter clean --verbose
flutter packages pub run build_runner build --delete-conflicting-outputs
./gradlew build    ./gradlew clean