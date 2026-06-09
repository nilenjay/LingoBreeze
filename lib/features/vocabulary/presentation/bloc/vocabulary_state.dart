import 'package:equatable/equatable.dart';
import '../../domain/entities/vocabulary_word.dart';

abstract class VocabularyState extends Equatable {
  const VocabularyState();
  
  @override
  List<Object> get props => [];
}

class VocabularyInitial extends VocabularyState {}

class VocabularyLoading extends VocabularyState {}

class VocabularyLoaded extends VocabularyState {
  final List<VocabularyWord> words;

  const VocabularyLoaded(this.words);

  @override
  List<Object> get props => [words];
}

class VocabularyEmpty extends VocabularyState {}

class VocabularyError extends VocabularyState {
  final String message;

  const VocabularyError(this.message);

  @override
  List<Object> get props => [message];
}

class VocabularyAddingWord extends VocabularyState {
  final List<VocabularyWord> currentWords;

  const VocabularyAddingWord(this.currentWords);

  @override
  List<Object> get props => [currentWords];
}
