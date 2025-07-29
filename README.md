# Eu Duvido! 🎯

A Flutter game application built with the BLoC pattern that challenges users with random questions. The app features a clean architecture with domain-driven design principles.

## 🚀 Features

- **Random Question Generator**: Get random questions to challenge yourself or friends
- **Clean Architecture**: Built with domain-driven design principles
- **BLoC State Management**: Efficient state management using the BLoC pattern
- **Cross-Platform**: Works on both iOS and Android

## 🏗️ Architecture

This project follows Clean Architecture principles with the following structure:

```
lib/
├── core/                    # Core utilities and shared components
├── features/               # Feature-based modules
│   └── game/              # Game feature
│       ├── application/   # Use cases and application logic
│       ├── controllers/   # Business logic controllers
│       ├── data/          # Data layer (repositories, data sources)
│       ├── domain/        # Domain layer (entities, repositories interfaces)
│       └── presentation/  # Presentation layer (UI, BLoC)
│           ├── bloc/      # BLoC components
│           ├── screens/   # UI screens
│           └── widgets/   # Reusable widgets
├── shared/                # Shared components and utilities
└── main.dart             # Application entry point
```

### Architecture Layers

1. **Presentation Layer**: Contains UI components, BLoC classes, and widgets
2. **Application Layer**: Contains use cases and application business logic
3. **Domain Layer**: Contains entities and repository interfaces
4. **Data Layer**: Contains repository implementations and data sources

## 🛠️ Tech Stack

- **Framework**: Flutter
- **State Management**: BLoC (Business Logic Component)
- **Architecture**: Clean Architecture with Domain-Driven Design
- **Language**: Dart

## 📦 Dependencies

- `flutter_bloc: ^8.1.4` - BLoC state management for Flutter
- `bloc: ^8.1.3` - Core BLoC library
- `cupertino_icons: ^1.0.8` - iOS-style icons

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.8.0)
- Dart SDK
- Android Studio / VS Code
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/eu_duvido.git
   cd eu_duvido
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🎮 How to Play

**Eu Duvido!** is a party-style trivia game where players challenge each other with unusual or difficult questions. The app gives you a random question with a hidden answer. Here's how it works:

1. **Tap "Play"** to get a random question
2. **Read the question out loud** to the group (e.g., "How many people have died throughout human history?")
3. **Players take turns guessing** the answer
4. **At any point, a player can say "Eu duvido!"** (I doubt it!) to challenge the most recent guess
5. **The app will then reveal the correct answer**
6. **Now it's up to the group:**
   - If the player who made the guess was close, the challenger drinks
   - If the guess was completely off, the person who made it drinks
7. **Press "New Question"** to keep playing

This game works best in a group setting with friends and drinks — just like a classic challenge game!

🧠 **Pro Tip:** You can customize how "close" is defined, based on how competitive your group is.

## 🧪 Testing

Run the tests using:
```bash
flutter test
```

## 📱 Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- BLoC team for the excellent state management solution
- Clean Architecture principles by Robert C. Martin

---

Made with ❤️ using Flutter and BLoC
