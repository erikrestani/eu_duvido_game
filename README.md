# Eu Duvido! 🎯

A Brazilian party game built with Flutter and BLoC pattern that challenges players with quantity-based questions. The app features a clean architecture with domain-driven design principles and is fully in Portuguese.

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
│   └── theme/              # App theme and styling system
│       └── app_theme.dart  # Centralized theme configuration
├── features/               # Feature-based modules
│   └── game/              # Game feature
│       ├── application/   # Use cases and application logic
│       ├── controllers/   # Business logic controllers
│       ├── data/          # Data layer (repositories, data sources)
│       ├── domain/        # Domain layer (entities, repositories interfaces)
│       └── presentation/  # Presentation layer (UI, BLoC)
│           ├── bloc/      # BLoC components
│           ├── screens/   # Complete UI screens
│           │   ├── home_page.dart      # Main container page
│           │   ├── welcome_screen.dart # Welcome screen
│           │   ├── rules_screen.dart   # Interactive rules screen
│           │   ├── loading_screen.dart # Loading screen
│           │   └── question_screen.dart # Game screen
│           └── widgets/   # Reusable UI components
├── shared/                # Shared components and utilities
│   └── widgets/           # Shared reusable widgets
│       └── animated_button.dart # Animated button component
└── main.dart             # Application entry point
```

### Architecture Layers

1. **Presentation Layer**: Contains UI screens, BLoC classes, and reusable widgets
2. **Application Layer**: Contains use cases and application business logic
3. **Domain Layer**: Contains entities and repository interfaces
4. **Data Layer**: Contains repository implementations and data sources

### UI Organization

- **Screens**: Complete UI screens that represent full pages
- **Widgets**: Reusable UI components used across multiple screens
- **Theme**: Centralized styling system for consistent design
- **BLoC**: State management for reactive UI updates

## 🛠️ Tech Stack

- **Framework**: Flutter
- **State Management**: BLoC (Business Logic Component)
- **Architecture**: Clean Architecture with Domain-Driven Design
- **UI System**: Centralized theme with reusable components
- **Language**: Dart

## 📦 Dependencies

- `flutter_bloc: ^8.1.4` - BLoC state management for Flutter
- `bloc: ^8.1.3` - Core BLoC library
- `cupertino_icons: ^1.0.8` - iOS-style icons

## 🎨 Design System

The app uses a centralized theme system (`AppTheme`) that provides:
- **Consistent colors** and gradients
- **Typography styles** for different text hierarchies
- **Spacing constants** for uniform layouts
- **Reusable decorations** for cards and containers
- **Button styles** and shadows
- **Modern UI components** with animations
- **Brazilian-inspired** color palette and design elements

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

**Eu Duvido!** (I Doubt It!) is a Brazilian party-style trivia game where players challenge each other with quantity-based questions. The app gives you a random question with a hidden answer. Here's how it works:

### 📖 **Game Rules:**

1. **Quantity Questions**: The game presents questions about quantities, such as "How many people can fit in a stadium?"

2. **Players in Order**: Players make their estimates in order, one at a time

3. **Life System**: Each player starts with 5 lives. Take good care of them!

4. **Losing Lives**: You lose a life when you doubt incorrectly or when someone doubts you

5. **Recovering Life**: Recover a life when you give an exact answer!

6. **How to Doubt**: Say "Eu duvido!" (I doubt it!) when you think someone is very wrong

### 🎯 **Game Flow:**

1. **Tap "Play"** to see the rules first
2. **Read the question out loud** to the group
3. **Players take turns guessing** the answer
4. **At any point, a player can say "Eu duvido!"** (I doubt it!) to challenge the most recent guess
5. **The app reveals the correct answer**
6. **Lives are updated** based on the outcome
7. **Press "New Question"** to keep playing

This game works best in a group setting with friends and drinks — just like a classic Brazilian challenge game!

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
- Brazilian gaming culture for the inspiration

---

Made with ❤️ in Brazil using Flutter and BLoC


