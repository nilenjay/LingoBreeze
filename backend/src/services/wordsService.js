const { admin, db } = require('../firebase/firebase');

const collectionName = 'words';

exports.getWords = async () => {
  // Sort by createdAt descending (newest first)
  const snapshot = await db.collection(collectionName).orderBy('createdAt', 'desc').get();
  
  if (snapshot.empty) {
    return [];
  }

  const words = [];
  snapshot.forEach(doc => {
    const data = doc.data();
    words.push({
      id: doc.id,
      word: data.word,
      meaning: data.meaning,
      translation: data.translation,
      // We can also return createdAt if needed, but the assignment only strictly requires the others for the UI
    });
  });

  return words;
};

exports.addWord = async (wordData) => {
  const docRef = db.collection(collectionName).doc();
  const newRecord = {
    ...wordData,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
  };
  
  await docRef.set(newRecord);
  
  return {
    id: docRef.id,
    word: wordData.word,
    meaning: wordData.meaning,
    translation: wordData.translation,
  };
};

// Architecture ready for DELETE later
exports.deleteWord = async (id) => {
  await db.collection(collectionName).doc(id).delete();
  return { id };
};
