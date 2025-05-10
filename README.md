

# iChat - A WhatsApp-like App

iChat is a mobile application designed to offer messaging functionality similar to WhatsApp, with a focus on simplicity and easy-to-use features. Currently, the app includes OTP-based phone number authentication using Firebase Authentication.

### Features (Currently Implemented)

* **Phone number authentication** using OTP (One-Time Password) via Firebase Authentication.
* **OTP countdown timer**: Resend OTP is enabled after 60 seconds.
* **Basic UI layout** for login screen and OTP verification screen.

### Future Features (Planned)

* User profile setup
* Chat functionality (text, image, and video)
* Real-time messaging using Firebase Firestore
* Push notifications for incoming messages
* Enhanced security with end-to-end encryption
* User status updates and profile picture management

---

## Getting Started

### Prerequisites

Before you can run this project locally, you will need to have the following installed:

* [Flutter](https://flutter.dev/docs/get-started/install)
* [Dart](https://dart.dev/get-dart)
* [Android Studio](https://developer.android.com/studio)
* [Xcode](https://developer.apple.com/xcode/) (if working on macOS for iOS development)
* Firebase account and project setup

### Steps to Run Locally

1. **Clone the repository**:
   If you haven't already cloned the repository, you can do so with the following command:

   ```bash
   git clone https://github.com/Finest321/ichat.git
   ```

2. **Navigate into the project directory**:

   ```bash
   cd ichat
   ```

3. **Install dependencies**:
   Run the following command to get all the required Flutter dependencies:

   ```bash
   flutter pub get
   ```

4. **Set up Firebase**:
   You need to integrate Firebase into the app. Follow these steps:

   * Go to the [Firebase Console](https://console.firebase.google.com/).
   * Create a new project or use an existing one.
   * Add your app to the Firebase project (Android and/or iOS).
   * Follow the Firebase setup instructions for both Android and iOS.

     * Download the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) and place it in the appropriate directory.
   * Enable **Firebase Authentication** and set up the **Phone authentication** sign-in method.

5. **Run the app**:
   Once you have set up Firebase and installed dependencies, you can run the app on an emulator or real device:

   ```bash
   flutter run
   ```

---

## Folder Structure

```
lib/
├── controllers/
│   ├── auth_controller.dart      # Logic for OTP authentication and user login
├── screens/
│   ├── login_screen.dart         # UI for phone number input and OTP request
│   ├── otp_screen.dart           # UI for OTP input and verification
└── main.dart                     # Entry point of the app
```

---

## Technologies Used

* **Flutter**: Framework for building the cross-platform mobile app.
* **Dart**: Programming language used for developing the app.
* **Firebase**: Backend service for authentication, database, and more.

  * **Firebase Authentication**: Used for phone number-based OTP authentication.
* **GetX**: State management and navigation solution for Flutter.

---

## Contributing

We welcome contributions! To contribute:

1. Fork the repository.

2. Clone your fork:

   ```bash
   git clone https://github.com/Finest321/ichat.git
   ```

3. Create a new branch:

   ```bash
   git checkout -b feature/your-feature
   ```

4. Make your changes and commit them:

   ```bash
   git commit -m "Add new feature"
   ```

5. Push your changes to your fork:

   ```bash
   git push origin feature/your-feature
   ```

6. Open a pull request to the `master` branch of the original repository.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Contact

Feel free to get in touch if you have any questions, feedback, or ideas for collaboration:

* **Email**: [unwanaudofa49@gmail.com](mailto:unwanaudofa49@gmail.com)
* **GitHub**: [Finest321](https://github.com/Finest321)
* **LinkedIn**: [Unwana Udofa](https://www.linkedin.com/in/unwana-udofa-9884201a4)

I'm open to job opportunities and collaborations. Let’s connect!


