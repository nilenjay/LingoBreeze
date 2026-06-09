import '../../../../../core/network/api_client.dart';
import '../models/vocabulary_word_model.dart';

abstract class VocabularyRemoteDatasource {
  Future<List<VocabularyWordModel>> getWords();
  Future<void> addWord({
    required String word,
    required String meaning,
    required String translation,
  });
}

class VocabularyRemoteDatasourceImpl implements VocabularyRemoteDatasource {
  final ApiClient apiClient;

  VocabularyRemoteDatasourceImpl(this.apiClient);

  @override
  Future<List<VocabularyWordModel>> getWords() async {
    final response = await apiClient.dio.get('/words');
    final List<dynamic> data = response.data;
    return data.map((json) => VocabularyWordModel.fromJson(json)).toList();
  }

  @override
  Future<void> addWord({
    required String word,
    required String meaning,
    required String translation,
  }) async {
    await apiClient.dio.post(
      '/words',
      data: {
        'word': word,
        'meaning': meaning,
        'translation': translation,
      },
    );
  }
}
