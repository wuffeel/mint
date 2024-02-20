# About the project

### Mint - Online consultations with psychologists

This is a mobile application for patients. It is a platform to book
consultations and chat with psychologists.

# Features

- Clean Architecture
- Online doctors list
- Favorite doctors
- Book consultations
- Payment for booking
- Chat with doctors
- Notifications about consultations and chat messages

# Built With

- [Flutter](https://flutter.dev/) - Cross platform framework to build applications with single codebase
- [Firebase](https://firebase.google.com/) - Backend as a service. Used for authentication, database, storage,
  notifications and Cloud Functions backend.
- [Flutter Bloc](https://bloclibrary.dev/) - State management library
- [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable) - Dependency injection
- [Stripe](https://stripe.com/) - Payment processing

# Getting Started

## Download the Project

Download or clone the full project repository by using link below:

```
https://github.com/wuffeel/mint_app
```

## Build & Run

Resolve Flutter dependencies:

```
flutter pub get
```

Run the app with different flavors:

- development: ```flutter run -t lib/main_development.dart --flavor development```
- production: ```flutter run -t lib/main_production.dart --flavor production```
- staging:```flutter run -t lib/main_staging.dart --flavor staging```

## Firebase

Project built with development, production and staging flavors.

To setup Firebase project, update

- `google-services.json` under
    - `android/app/src/main`
    - `android/app/src/development`
    - `android/app/src/staging`

- `GoogleService-Info.plist` under
    - `ios/config/production`
    - `ios/config/development`
    - `ios/config/staging`
