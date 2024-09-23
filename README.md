# Chat App - Flutter & Firebase

A Flutter-based real-time chat application powered by Firebase. This project demonstrates how to build a functional one-on-one chat app using Flutter and Firebase Firestore for backend services, including user authentication and real-time messaging.

> The app currently supports one-on-one messaging, user authentication, and profile management. Features like group chats, media sharing, stories, and push notifications are planned for future releases.

## Features

- **User Authentication:** Sign up and log in functionality using Firebase Authentication (email and password).
- **One-on-One Messaging:** Send and receive messages instantly with Firebase Firestore.
- **Profile Management:** Update user profiles and display profile images.


## Dependencies

- [**Firebase Core:**](https://pub.dev/packages/firebase_core) Required for connecting the app to Firebase.
- [**Firebase Auth:**](https://pub.dev/packages/firebase_auth) For user authentication.
- [**Cloud Firestore:**](https://pub.dev/packages/cloud_firestore) For real-time database and message storage.
- [**Firebase Storage:**](https://pub.dev/packages/firebase_storage) For storing profile pictures.
- [**Flutter Riverpod:**](https://riverpod.dev/) For state management.
- [**Image Picker:**](https://pub.dev/packages/image_picker)  For selecting images from the gallery or camera.
- [**Go Router:**](https://pub.dev/packages/go_router) For navigation
- [**Shared Preferences:**](https://pub.dev/packages/shared_preferences) For storing simple data

## Screenshots

Sign In (Dark)            |  Sign in (Light)           | Sign Up (Dark)            | Sign Up (Light)
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/user-attachments/assets/b862568b-7c18-4069-85f8-36b0f51f146c)|![](https://github.com/user-attachments/assets/93c05576-e0b5-4684-a4a1-14d46b442e8d)|![](https://github.com/user-attachments/assets/23d752e8-fc58-4bb7-a022-b6f3e551e3d6)|![](https://github.com/user-attachments/assets/2ff0d168-aab9-4830-bdf1-6e828a1de008)

Home Screen (Dark)         |  Home Screen (Light)      |  Chat Screen (Dark)       | Chat Screen (Light)
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/user-attachments/assets/b5af4615-0d17-4d0c-9bc2-fcdffc0432a2)|![](https://github.com/user-attachments/assets/0926bba0-2a76-4601-8291-57fe0a700901)| ![](https://github.com/user-attachments/assets/8d68b4fd-03b6-41ba-b075-520f7602343a)|![](https://github.com/user-attachments/assets/64ea72ff-43b8-4a64-bc89-af1e0ccf8f87)



Profile Screen (Dark)     | Profile Screen (Light)     |Theme Mode Selection (Dark)|Theme Mode Selection  (Light)
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/user-attachments/assets/5a146abd-3f78-4f1e-a6ed-9705856fd512)|![](https://github.com/user-attachments/assets/c3639ab9-902c-401f-9028-69bfab6c4bc6)|![](https://github.com/user-attachments/assets/77466a35-a209-4cde-8311-48f076a7038a)|![](https://github.com/user-attachments/assets/a483fd3a-7cf9-40ad-947f-b93dfb203dee)|


Manage User Screen (Dark)  | Manage User Screen (Light)| Edit Profile Screen (Dark)|Edit Profile Screen (Light)
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/user-attachments/assets/3e1f4552-69de-46e0-81c7-1e01ee2e335b)|![](https://github.com/user-attachments/assets/715bd0cf-0461-4d94-bb2e-e8a4cb935b80)|![](https://github.com/user-attachments/assets/72bba5c1-08fc-42b5-bd74-db9fa0ed6629)|![](https://github.com/user-attachments/assets/0079f0be-c33f-40f6-bd3b-13ba89035486)


## Planned Features

- **Group Chats:** Ability to create and join group conversations.
- **Push Notifications:** Receive real-time notifications for new messages.
- **Media Sharing:** Send and receive media files (images, videos) within the chat.
- **Story Sharing:** Picture and video sharing deleted after 24 hours.
  
These features are not yet available but may be implemented in future updates.

## Requirements

- Flutter SDK
- Firebase account and project setup
- Android Studio or Xcode for iOS

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/metinilgar/chat-app-flutter-firebase.git
    ```

2. Navigate to the project directory:

    ```bash
    cd chat-app-flutter-firebase
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Set up Firebase:
    - Create a new project with the Firebase console
    - Enable Firebase Authentication, along with the Email/Password Authentication Sign-in provider in the Firebase Console (Authentication > Sign-in method > Email/Password > Edit > Enable > Save)
    - Enable Firestore Database and Storage
    - Follow the [Firebase setup guide](https://firebase.google.com/docs/flutter/setup) to configure Firebase for your project.

5. Run the app on an emulator or physical device:

    ```bash
    flutter run
    ```

## Contribution

Contributions are welcome! If you have any ideas for new features or improvements, feel free to submit an issue or open a pull request.

1. Fork the repository.
2. Create a new branch:

    ```bash
    git checkout -b feature-branch
    ```

3. Commit your changes:

    ```bash
    git commit -m "Add new feature"
    ```

4. Push to the branch:

    ```bash
    git push origin feature-branch
    ```

5. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/metinilgar/chat-app-flutter-firebase/blob/main/LICENSE) file for more details.

## Contact

For any questions or suggestions, feel free to reach out to me on [LinkedIn](https://www.linkedin.com/in/metinilgarmutlu/) or visit my [GitHub](https://github.com/metinilgar) profile for more projects.
