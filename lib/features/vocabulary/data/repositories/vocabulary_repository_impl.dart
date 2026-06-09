import '../../../../../core/error/exceptions.dart';
import '../../domain/entities/vocabulary_word.dart';
import '../../domain/repositories/vocabulary_repository.dart';
import '../datasources/vocabulary_remote_datasource.dart';

class VocabularyRepositoryImpl implements VocabularyRepository {
  final VocabularyRemoteDatasource remoteDataSource;

  VocabularyRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<VocabularyWord>> getWords() async {
    try {
      return await remoteDataSource.getWords();
    } on ServerException {
      rethrow;
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<void> addWord({
    required String word,
    required String meaning,
    required String translation,
  }) async {
    try {
      await remoteDataSource.addWord(
        word: word,
        meaning: meaning,
        translation: translation,
      );
    } on ServerException {
      rethrow;
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}
