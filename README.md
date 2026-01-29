# Dr. Record 🩺

<p align="center">
  <img src="assets/images/app_logo.png" width="150" alt="Dr. Record Logo">
</p>

**Dr. Record** is a premium, professional digital medical assistant built with Flutter, designed to help clinicians and healthcare providers manage patient records with ease and efficiency. The application focuses on a modern user experience, secure data management, and intelligent medical tracking.

## ✨ Features

- 🏥 **Comprehensive Patient Profiles**: Organize all patient medical data in one unified view.
- 📜 **Medical History Tracking**: Maintain detailed chronological records of past illnesses and treatments.
- 🧪 **Digital Examination Records**: Log vital healthcare information and clinical physical examination findings.
- 🧠 **Smart Analysis Tools**: Analyze symptoms and clinical trends to aid diagnosis.
- 🔒 **Secure Data Management**: Backend powered by Firebase for secure authentication and real-time data persistence.
- 🌟 **Premium Aesthetics**:
    - **Skeleton Loading**: Modern loading states powered by `Skeletonizer`.
    - **Smooth Animations**: Interactive UI with `animate_do`.
    - **Intelligent Navigation**: Seamless transitions using `go_router` wrapped in simplified custom methods.
- 📱 **User-Centric Design**:
    - Interactive Onboarding Experience.
    - Professional Dashboard with disease categories.
    - Global Search with filtering and sorting capabilities.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev) (Dart)
- **State Management**: [Cubit](https://pub.dev/packages/flutter_bloc) (Bloc)
- **Database & Auth**: [Firebase](https://firebase.google.com) (Firestore & Auth)
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router)
- **UI & Layout**:
    - `skeletonizer` for loading states.
    - `animate_do` for animations.
    - `google_nav_bar` for modern bottom navigation.
    - `smooth_page_indicator` for onboarding.

## 📂 Project Structure

```text
lib/
├── component/             # Shared UI widgets (Buttons, TextFields, etc.)
├── core/                  # Core application logic
│   ├── cubits/            # Core state management (Theme, etc.)
│   ├── navigation/        # Routing and navigation configuration
│   ├── services/          # Firebase and Shared Preferences helpers
│   └── utils/             # Constants, themes, and styles
├── features/              # Feature-based design
│   ├── data/              # Models and data logic
│   └── presentation/      # UI screens, widgets, and feature-specific cubits
└── main.dart              # Application entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Firebase Account and Project

### Installation

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase:**
   - Ensure the `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) are properly placed in their respective directories.
   - Run `flutterfire configure` if you have the CLI installed.

4. **Run the application:**
   ```bash
   flutter run
   ```

## 📝 License

This project is developed by **Mustafa Abdelrahim Ibrahim** as a professional medical management solution.

---
<p align="center">Made with ❤️ for the healthcare community.</p>
