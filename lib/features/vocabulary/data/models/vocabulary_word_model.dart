import '../../domain/entities/vocabulary_word.dart';

class VocabularyWordModel extends VocabularyWord {
  const VocabularyWordModel({
    required super.id,
    required super.word,
    required super.meaning,
    required super.translation,
  });

  factory VocabularyWordModel.fromJson(Map<String, dynamic> json) {
    return VocabularyWordModel(
      id: json['id'] as String,
      word: json['word'] as String,
      meaning: json['meaning'] as String,
      translation: json['translation'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'word': word,
      'meaning': meaning,
      'translation': translation,
    };
  }
}
