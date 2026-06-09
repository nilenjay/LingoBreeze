import '../entities/vocabulary_word.dart';

abstract class VocabularyRepository {
  Future<List<VocabularyWord>> getWords();
  Future<void> addWord({
    required String word,
    required String meaning,
    required String translation,
  });
}
