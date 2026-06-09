const admin = require('firebase-admin');

// Note: To run this backend, you need a serviceAccountKey.json from Firebase Console.
// For the sake of the assignment structure, we initialize it here.
// In a real environment, you'd use credentials from env variables or a secure file.

try {
  // Try to initialize with a local service account key if it exists
  const serviceAccount = require('../../serviceAccountKey.json');
  admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
  });
  console.log('Firebase Admin initialized with serviceAccountKey.json');
} catch (e) {
  // Fallback or warning if credentials are not provided
  console.warn('WARNING: serviceAccountKey.json not found. Firebase operations will fail unless default credentials are in the environment.');
  admin.initializeApp();
}

const db = admin.firestore();

module.exports = { admin, db };
