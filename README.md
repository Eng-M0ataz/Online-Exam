# 🎓 Online Exam - Mobile Application
<br><br>
<div align="center">
  <img src="assets/images/logo.png" alt="Online Exam Logo" width="200"/>

<br><br>

  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
  [![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://developer.android.com/)
  [![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)](https://developer.apple.com/ios/)
  [![BLoC](https://img.shields.io/badge/BLoC-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://bloclibrary.dev/)
</div>

## 📱 نظرة عامة / Overview

**Online Exam** هو تطبيق Flutter متكامل لإدارة الامتحانات الإلكترونية يتيح للطلاب أداء امتحانات متعددة الاختيار مع تتبع النتائج وتحليل الأداء.

**Online Exam** is a comprehensive Flutter application for managing online exams that allows students to take multiple-choice exams while tracking results and analyzing performance.

## ✨ المميزات الرئيسية / Key Features

### 🎯 المميزات الأساسية / Core Features

- **🔐 المصادقة والتسجيل** - تسجيل دخول وتسجيل حساب جديد
- **📧 التحقق من البريد الإلكتروني** - التحقق من البريد الإلكتروني باستخدام رمز OTP
- **🔑 استعادة كلمة المرور** - استعادة كلمة المرور المنسية
- **📚 الاختبارات حسب المادة** - تصفح الاختبارات حسب المادة الدراسية
- **⏱️ مؤقت الامتحان** - امتحانات محددة بوقت مع مؤقت تنازلي
- **📝 امتحانات متعددة الاختيار** - أسئلة متعددة الاختيار مع واجهة سهلة الاستخدام
- **📊 تتبع النتائج** - عرض النتائج السابقة مع التحليل التفصيلي
- **💾 حفظ محلي** - حفظ تاريخ الامتحانات محلياً
- **👤 إدارة الملف الشخصي** - عرض وتعديل بيانات المستخدم
- **🌐 دعم متعدد اللغات** - دعم اللغة العربية والإنجليزية

### 🎯 Core Features

- **🔐 Authentication & Registration** - User login and account registration
- **📧 Email Verification** - Email verification using OTP code
- **🔑 Password Recovery** - Recover forgotten passwords
- **📚 Subject-Based Exams** - Browse exams by subject
- **⏱️ Exam Timer** - Time-limited exams with countdown timer
- **📝 Multiple Choice Questions** - MCQ with user-friendly interface
- **📊 Results Tracking** - View previous results with detailed analysis
- **💾 Local Storage** - Store exam history locally
- **👤 Profile Management** - View and edit user information
- **🌐 Multi-Language Support** - Support for Arabic and English

## 🛠️ التقنيات المستخدمة / Technologies Used

### Frontend Framework
- **Flutter** - Cross-platform mobile development framework
- **Dart** - Programming language
- **Material Design** - UI design system
- **Flutter ScreenUtil** - Screen size adaptation

### State Management
- **Flutter Bloc** - Predictable state management
- **Cubit** - Lightweight state management
- **BlocProvider** - Dependency injection for state

### Data Management
- **Hive** - Fast, lightweight key-value database for local storage
- **Dio** - Powerful HTTP client for API calls
- **Get It** - Service locator for dependency injection
- **Injectable** - Code generation for dependency injection
- **Retrofit** - Type-safe HTTP client

### Networking
- **Dio** - HTTP client with interceptors
- **Pretty Dio Logger** - Beautiful logging for network requests
- **Internet Connection Checker** - Network connectivity monitoring

### UI/UX Libraries
- **Cached Network Image** - Efficient image caching
- **Flutter SVG** - SVG rendering support
- **Lottie** - Beautiful animations
- **Skeletonizer** - Skeleton loading animations
- **Percent Indicator** - Progress indicators
- **Flutter Timer Countdown** - Countdown timer widget
- **Flutter OTP Text Field** - OTP input field
- **Expandable Page View** - Expandable page view for questions

### Additional Features
- **Shared Preferences** - Simple key-value storage
- **Flutter Localizations** - Internationalization support
- **JSON Serialization** - Automatic JSON encoding/decoding
- **Fluttertoast** - Toast notifications

### Development Tools
- **Build Runner** - Code generation
- **Flutter Lints** - Linting rules
- **Flutter Launcher Icons** - App icon generation
- **Flutter Native Splash** - Splash screen configuration

## 🏗️ Architecture

### Clean Architecture Pattern

The project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/                          # Core functionality
│   ├── classes/                   # Core classes
│   ├── di/                        # Dependency injection
│   ├── enums/                     # Enumerations
│   ├── errors/                    # Error handling
│   ├── functions/                 # Helper functions
│   ├── helpers/                   # Utility helpers
│   ├── l10n/                      # Localization
│   ├── network/                   # Network layer
│   ├── utils/                     # Utilities
│   └── widgets/                   # Reusable widgets
├── config/
│   ├── routing/                   # Navigation configuration
│   └── theme/                     # App theme
└── features/                      # Feature modules
    ├── auth/                      # Authentication feature
    │   ├── data/                  # Data layer
    │   │   ├── data_sources/     # Remote & local data sources
    │   │   ├── models/           # Data models
    │   │   └── repositories/     # Repository implementations
    │   ├── domain/                # Domain layer
    │   │   ├── entities/         # Business entities
    │   │   ├── repositories/     # Repository interfaces
    │   │   └── use_cases/        # Business logic
    │   └── presentation/          # Presentation layer
    │       ├── manager/          # BLoC/Cubit
    │       ├── pages/            # UI screens
    │       └── widgets/          # Feature widgets
    ├── Exam/                      # Exam feature
    ├── main_layout/               # Main layout with navigation
    │   ├── explore/              # Explore subjects
    │   ├── profile/              # User profile
    │   └── results/              # Exam results
    ├── subject_exams/             # Subject exams listing
    ├── specific_exam/             # Specific exam details
    └── splash/                    # Splash screen
└── main.dart                      # App entry point
```
## 📸 لقطات الشاشة / Screenshots

### Authentication Screens / شاشات المصادقة
<div align="center">
  <img width="250" alt="Login Screen" src="https://github.com/user-attachments/assets/fbcfbef9-ed3f-4903-a3d7-4360fbdfe3a5" />
  <img width="250" alt="Signup Screen" src="https://github.com/user-attachments/assets/b1ec8ff0-3266-4bbc-bef5-26cb8a2bcec1" />
  <img width="250" alt="Forgot Password" src="https://github.com/user-attachments/assets/b68d1694-dad0-4684-81b3-82cd127f1ee1" />
  <img width="250" alt="Email Verification" src="https://github.com/user-attachments/assets/92509e6b-3cb7-4cc3-ad12-67bc9c24849f" />
  <img width="250" alt="Reset Password" src="https://github.com/user-attachments/assets/7600a7ba-ae24-4f5f-9e97-6d07b5a0c778" />
</div>

### Main Application Screens / الشاشات الرئيسية
<div align="center">
  <img width="250" height="2359" alt="Image" src="https://github.com/user-attachments/assets/ddb9d240-7d98-4886-a4c7-33eb3e2c7c53" />
  <img width="250" alt="Explore Subjects" src="https://github.com/user-attachments/assets/e5c11646-4dae-42d7-b18b-11bc012bc36d" />
  <img width="250" alt="Results Empty State" src="https://github.com/user-attachments/assets/d04c1e37-52c0-4307-bb1b-03f96658e208" />
  <img width="250" alt="Profile Screen" src="https://github.com/user-attachments/assets/10011780-ccf7-4b36-b578-578f7895ca3f" />
</div>

### Explore & Exam Selection / استكشاف واختيار الامتحانات
<div align="center">
  <img width="250" alt="JavaScript Exam" src="https://github.com/user-attachments/assets/59e6fa44-6d39-4c99-8d83-98344c4ef173" />
  <img width="250" alt="Angular Exam" src="https://github.com/user-attachments/assets/77a20d09-9a47-42af-9838-7def445993e9" />
  <img width="250" alt="Exam Instructions" src="https://github.com/user-attachments/assets/e112486d-9c6f-4107-be1d-3336bb4b0954" />
</div>

### Exam Experience / تجربة الامتحان
<div align="center">
  <img width="250" alt="Exam Question" src="https://github.com/user-attachments/assets/394f75eb-0c40-49d9-849a-fcc6b181a6b6" />
  <img width="250" alt="Question with Selected Answer" src="https://github.com/user-attachments/assets/62b070a4-b43b-4236-9dbc-e959b1cf4af7" />
  <img width="250" alt="Answer Validation" src="https://github.com/user-attachments/assets/0bdb3444-8a1d-43d8-910f-fe413b1005e1" />
  <img width="250" alt="Last Question" src="https://github.com/user-attachments/assets/4bdec603-d8ce-4f41-bcbe-af6df879dd77" />
</div>

### Results & Review / النتائج والمراجعة
<div align="center">
  <img width="250" alt="Exam Score" src="https://github.com/user-attachments/assets/5b83d724-7102-4308-aa55-173ceafe4b8a" />
  <img width="250" alt="Results List" src="https://github.com/user-attachments/assets/31c5872d-0e89-449d-8a0a-4273f182e96a" />
  <img width="250" alt="Answer Review" src="https://github.com/user-attachments/assets/f3214d9c-37e0-47a0-8a9e-ffd11d2a757f" />
  <img width="250" alt="Detailed Answer Review" src="https://github.com/user-attachments/assets/829b9e33-3244-46d6-a787-faae3bdeedce" />
</div>

<br><br>

### Architecture Layers

1. **Presentation Layer** - UI, widgets, and state management (BLoC/Cubit)
2. **Domain Layer** - Business logic, entities, and use cases
3. **Data Layer** - Data sources, models, and repository implementations

### Design Patterns

- **Repository Pattern** - Abstraction of data sources
- **BLoC Pattern** - State management
- **Dependency Injection** - Loose coupling and testability
- **Use Case Pattern** - Encapsulation of business logic





## 🚀 المميزات التقنية / Technical Features

### Performance Optimizations
- **Image Caching** - Efficient image loading and caching
- **Local Storage** - Fast access to exam history
- **Lazy Loading** - Efficient data loading
- **Memory Management** - Optimized resource usage
- **Skeleton Loading** - Better perceived performance

### State Management
- **BLoC Pattern** - Predictable state changes
- **Cubit** - Lightweight state management
- **ValueNotifier** - Reactive updates

### User Experience
- **Responsive Design** - Works on all screen sizes
- **Smooth Animations** - Fluid transitions
- **Loading States** - User feedback
- **Error Handling** - Graceful error management
- **Toast Notifications** - User-friendly messages
- **Internationalization** - Multi-language support

### Data Persistence
- **Hive Database** - Fast local storage
- **Shared Preferences** - Simple key-value storage
- **Secure Storage** - Encrypted data storage

### Networking
- **REST API Integration** - API communication
- **Retrofit** - Type-safe API clients
- **Dio Interceptors** - Request/response handling
- **Error Handling** - Network error management
- **Internet Connectivity** - Network status monitoring

## 📱 المنصات المدعومة / Supported Platforms

- ✅ **Android** (API 21+)
- ✅ **iOS** (iOS 11+)
- 🔄 **Web** (Planning)
- 🔄 **Windows** (Planning)

## 🎨 Features Breakdown

### Authentication Module
- User registration with validation
- Secure login
- Email verification with OTP
- Password recovery
- Remember me functionality
- Token-based authentication

### Exam Module
- Subject-based exam browsing
- Exam details and instructions
- Timer-based exams
- Multiple choice questions
- Progress tracking
- Navigation between questions
- Final score calculation
- Result history

### Results Module
- View exam history
- Detailed score breakdown
- Correct/incorrect answers tracking
- Performance statistics

### Profile Module
- User information display
- Profile editing
- Password change
- Account management

## 🔧 Configuration

### Environment Setup

Configure your API endpoints in the network configuration:

```dart
// lib/core/network/api_constants.dart
class ApiConstants {
  static const String baseUrl = 'YOUR_API_BASE_URL';
  static const String apiKey = 'YOUR_API_KEY';
}
```

### Localization

Add translations in `lib/core/l10n/app_en.arb`:

```json
{
  "key": "value"
}
```

### Theme Configuration

Customize app theme in `lib/config/theme/app_theme.dart`

## 🤝 المساهمة / Contributing

نرحب بمساهماتكم! يرجى اتباع الخطوات التالية:

We welcome contributions! Please follow these steps:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Contribution Guidelines

- Follow Flutter best practices
- Write clean, maintainable code
- Add comments for complex logic
- Follow the existing code structure
- Write meaningful commit messages
- Test your changes thoroughly

## 👨‍💻 Developers

**Development Team**

- name  :  Moataz Ebrahim
- Email :  moatazebrahim221@gmail.com
- GitHub:  https://github.com/Eng-M0ataz
  <br><br>
- name  :  Wasim Ghonim
- Email :  wasimghoniem@gmail.com
- GitHub:  https://www.linkedin.com/in/wasim-ghonim-37bb98333/
## 🙏 Acknowledgments

- [Flutter Team](https://flutter.dev/) - For the amazing framework
- [BLoC Library](https://bloclibrary.dev/) - For Transparency & Simplicity
- [Hive](https://pub.dev/packages/hive) - For fast local storage
- [Retrofit](https://pub.dev/packages/retrofit) - For type-safe HTTP clients
- All contributors and open-source community

## 📞 Support

إذا واجهت أي مشاكل أو لديك أسئلة، يرجى فتح issue في GitHub.

If you encounter any issues or have questions, please open an issue on GitHub.

---

<div align="center">
  <p>صُنع بـ ❤️ باستخدام Flutter</p>
  <p>Made with ❤️ using Flutter</p>
</div>
