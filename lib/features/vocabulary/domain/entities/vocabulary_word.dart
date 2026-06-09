import 'package:equatable/equatable.dart';

class VocabularyWord extends Equatable {
  final String id;
  final String word;
  final String meaning;
  final String translation;

  const VocabularyWord({
    required this.id,
    required this.word,
    required this.meaning,
    required this.translation,
  });

  @override
  List<Object?> get props => [id, word, meaning, translation];
}
