# LingoBreeze

## 1. Project Overview
LingoBreeze is a modern, responsive vocabulary management application built with Flutter and Node.js. It allows users to build their personal dictionary by saving words, their meanings, and translations, enabling them to review and master new vocabulary anytime.

## 2. Features
- **Add Vocabulary**: Save new words along with their meanings and translations.
- **View Vocabulary**: Browse a list of all saved words in an elegant, Material 3-compliant card layout.
- **Pull-to-Refresh**: Easily sync and fetch the latest words from the cloud.
- **State Management**: Robust BLoC state management ensuring reliable Loading, Empty, and Error states.
- **Clean Architecture**: Separation of concerns on both the Flutter frontend and the Express/Node.js backend.
- **Responsive UI**: Adapts smoothly to different screen sizes.

## 3. Architecture
The project is divided into two main components:
- **Frontend (Flutter)**: Implements Clean Architecture principles (Domain, Data, and Presentation layers) and utilizes the `flutter_bloc` package for state management.
- **Backend (Node.js)**: A RESTful API built with Express, integrated with Firebase Admin SDK to interact with Firestore.

## 4. Folder Structure
```text
lingobreeze/
├── backend/                  # Node.js backend
│   ├── src/
│   │   ├── controllers/      # Route controllers (req/res handling)
│   │   ├── firebase/         # Firebase Admin SDK initialization
│   │   ├── routes/           # Express route definitions
│   │   └── services/         # Business logic & Firestore interactions
│   ├── server.js             # Express app entry point
│   └── package.json          # Backend dependencies
├── lib/                      # Flutter frontend
│   ├── core/                 # Shared widgets, error handling, network helpers
│   ├── features/
│   │   └── vocabulary/       # Vocabulary feature module
│   │       ├── bloc/         # BLoC state management
│   │       ├── data/         # Repositories and Data Sources
│   │       ├── domain/       # Entities and Use Cases
│   │       └── presentation/ # UI pages and widgets
│   └── main.dart             # Flutter app entry point
└── README.md                 # Project documentation
```

## 5. Setup Instructions

### Prerequisites
- Flutter SDK (latest stable version)
- Node.js (v18 or higher)
- A Firebase project with Firestore enabled

## 6. Firebase Setup
1. Go to the [Firebase Console](https://console.firebase.google.com/).
2. Create a new project and enable **Firestore Database**.
3. Generate a new private key from **Project Settings > Service Accounts**.
4. Download the JSON file and rename it to `serviceAccountKey.json`.
5. Place this file in the `lingobreeze/backend/` directory.

## 7. Backend Setup
1. Navigate to the backend directory:
   ```bash
   cd backend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the server:
   ```bash
   npm start
   ```
   *The server will run on `http://localhost:3000` by default.*

## 8. Running Flutter
1. Navigate to the root directory:
   ```bash
   cd lingobreeze
   ```
2. Get Flutter dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```
   *Note: Ensure your emulator or physical device is connected. For Android emulators, `localhost` points to the host machine's `10.0.2.2`. Check `lib/core/network/api_client.dart` to adjust the `baseUrl` if necessary.*

## 9. API Endpoints

### `GET /words`
Retrieves all saved vocabulary words, sorted by newest first.
- **Response (200 OK):**
  ```json
  [
    {
      "id": "doc_id",
      "word": "Hola",
      "meaning": "A greeting",
      "translation": "Hello"
    }
  ]
  ```

### `POST /words`
Adds a new word to the vocabulary list.
- **Request Body:**
  ```json
  {
    "word": "Hola",
    "meaning": "A greeting",
    "translation": "Hello"
  }
  ```
- **Response (201 Created):** Returns the newly created word object.
- **Response (400 Bad Request):** If any required fields are missing or empty.

## 10. Screenshots
*(Add screenshots here showing the Empty State, Loading State, Vocabulary List, and Add Word Bottom Sheet)*
- `assets/screenshots/empty_state.png`
- `assets/screenshots/list_view.png`
- `assets/screenshots/add_word.png`

## 11. AI Contribution
- **UI/UX Polish**: 90% (Material 3 styling, Extended FAB, State Widgets)
- **Flutter Code Generation**: 70% (BLoC integration, Clean Architecture scaffold)
- **Backend Setup**: 80% (Express endpoints, Firestore service)
- **Architecture**: 50% (Refinement and separation of concerns)
