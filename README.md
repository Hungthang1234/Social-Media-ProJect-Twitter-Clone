# 𝕏 Twitter Clone

<div align="center">

A modern, feature-rich Twitter clone built with **Flutter** and **Firebase**.

[![Flutter](https://img.shields.io/badge/Flutter-3.5.4%2B-blue?style=flat-square&logo=flutter)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Cloud%20Firestore-yellow?style=flat-square&logo=firebase)](https://firebase.google.com)
[![Dart](https://img.shields.io/badge/Dart-3.5.4%2B-blue?style=flat-square&logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)

[Features](#features) • [Tech Stack](#tech-stack) • [Installation](#installation) • [Project Structure](#project-structure)

</div>

---

## 📱 About

**Twitter Clone** is a comprehensive social media application that replicates the core functionality and user experience of Twitter/X. Built with modern Flutter practices and powered by Firebase, this project demonstrates professional mobile app development skills including real-time data synchronization, user authentication, and responsive UI design.

## ✨ Features

### 👤 User Management
- **User Authentication** - Secure registration and login with Firebase Auth
- **User Profiles** - Customizable profiles with avatar, bio, and statistics
- **Follow System** - Follow/unfollow other users
- **User Discovery** - Search and explore users

### 📝 Posting & Content
- **Tweet Creation** - Post text-based tweets
- **Like System** - Like and unlike tweets
- **Retweets** - Share and engage with existing tweets
- **Tweet Feed** - Real-time feed with latest tweets from followed users
- **Tweet Details** - View full tweet details and interactions

### 💬 Engagement
- **Comments/Replies** - Reply to tweets
- **Real-time Updates** - Live updates using Cloud Firestore listeners
- **Engagement Metrics** - View likes, retweets, and reply counts

### 🎨 User Interface
- **Modern Design** - Clean and intuitive UI following Material Design principles
- **Dark/Light Theme** - Support for different color schemes
- **Responsive Layout** - Optimized for different screen sizes
- **Smooth Animations** - Polished transitions and interactions

## 🛠️ Tech Stack

| Component | Technology |
|-----------|-----------|
| **Frontend** | Flutter 3.5.4+ |
| **Language** | Dart 3.5.4+ |
| **Backend** | Firebase |
| **Database** | Cloud Firestore |
| **Authentication** | Firebase Auth |
| **State Management** | Provider 6.0.0+ |
| **Localization** | Intl 0.18.0+ |
| **Icon Library** | Cupertino Icons |

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (3.5.4 or higher) - [Download](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (included with Flutter)
- **Git** - [Download](https://git-scm.com)
- **Firebase Project** - [Create on Firebase Console](https://console.firebase.google.com)

### Platform Requirements
- **Android**: API level 21 or higher
- **iOS**: iOS 11.0 or higher
- **Windows**: Windows 10 or higher
- **Web**: Modern browser with ES6 support

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/Hungthang1234/Social-Media-ProJect-Twitter-Clone.git
cd Social-Media-ProJect-Twitter-Clone
```

### 2. Install Flutter Dependencies

```bash
flutter pub get
```

### 3. Set Up Firebase Project

1. Create a new project on [Firebase Console](https://console.firebase.google.com)
2. Enable the following services:
   - **Authentication** (Email/Password)
   - **Cloud Firestore**
   - **Storage** (optional, for profile images)

3. Download and configure Firebase credentials:
   - For Android: `google-services.json`
   - For iOS: `GoogleService-Info.plist`
   - Place them in the appropriate directories

4. Update `lib/firebase_options.dart` with your Firebase configuration

### 4. Run the Application

**Development Mode:**
```bash
flutter run
```

**Release Build (Android):**
```bash
flutter build apk --release
```

**Release Build (iOS):**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter run -d chrome
```

## 📁 Project Structure

```
lib/
├── models/              # Data models
│   ├── user_model.dart
│   ├── tweet_model.dart
│   └── ...
├── pages/               # UI screens
│   ├── home_page.dart
│   ├── profile_page.dart
│   ├── login_page.dart
│   └── ...
├── components/          # Reusable UI components
│   ├── tweet_card.dart
│   ├── user_card.dart
│   └── ...
├── services/           # Business logic & API
│   ├── auth_service.dart
│   ├── firestore_service.dart
│   └── ...
├── themes/             # App styling
│   ├── app_theme.dart
│   └── colors.dart
├── helper/             # Utility functions
│   ├── validators.dart
│   └── ...
├── firebase_options.dart    # Firebase config
└── main.dart           # App entry point
```

## 🔧 Key Components

### Authentication Service
Handles user registration, login, and session management using Firebase Authentication.

### Firestore Service
Manages all database operations including:
- User data management
- Tweet CRUD operations
- Follow relationships
- Real-time data synchronization

### State Management
Provider package is used for:
- User state
- Tweet list state
- Authentication state
- Theme preferences

## 📸 Screenshots

*Add your app screenshots here to showcase the UI*

## 🤝 Contributing

Contributions are welcome! To contribute:

1. **Fork** the repository
2. **Create** your feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

Please ensure your code follows Dart style guidelines and includes appropriate comments.

## 📝 Best Practices

- ✅ Follow Dart naming conventions
- ✅ Write meaningful commit messages
- ✅ Test your changes locally before submitting
- ✅ Update documentation as needed
- ✅ Keep code modular and reusable

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Hung Thang**
- GitHub: [@Hungthang1234](https://github.com/Hungthang1234)

## 🙏 Acknowledgments

- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Dart Language Guide](https://dart.dev/guides)

## 📞 Support

For questions or issues, please:
- Open an [Issue](https://github.com/Hungthang1234/Social-Media-ProJect-Twitter-Clone/issues)
- Check existing documentation
- Review [Flutter troubleshooting](https://flutter.dev/docs/testing/troubleshooting)

---

<div align="center">

Made with ❤️ by Hung Thang

[⬆ Back to Top](#-twitter-clone)

</div>
