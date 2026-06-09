import 'package:equatable/equatable.dart';

abstract class VocabularyEvent extends Equatable {
  const VocabularyEvent();

  @override
  List<Object> get props => [];
}

class LoadWords extends VocabularyEvent {}

class RefreshWords extends VocabularyEvent {}

class AddWord extends VocabularyEvent {
  final String word;
  final String meaning;
  final String translation;

  const AddWord({
    required this.word,
    required this.meaning,
    required this.translation,
  });

  @override
  List<Object> get props => [word, meaning, translation];
}
