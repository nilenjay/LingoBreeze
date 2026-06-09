import '../repositories/vocabulary_repository.dart';

class AddWordUseCase {
  final VocabularyRepository repository;

  AddWordUseCase(this.repository);

  Future<void> call({
    required String word,
    required String meaning,
    required String translation,
  }) async {
    return await repository.addWord(
      word: word,
      meaning: meaning,
      translation: translation,
    );
  }
}
