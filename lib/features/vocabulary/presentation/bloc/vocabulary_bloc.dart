import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/vocabulary_word.dart';
import '../../domain/usecases/add_word_usecase.dart';
import '../../domain/usecases/get_words_usecase.dart';
import 'vocabulary_event.dart';
import 'vocabulary_state.dart';

class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  final GetWordsUseCase getWordsUseCase;
  final AddWordUseCase addWordUseCase;

  VocabularyBloc({
    required this.getWordsUseCase,
    required this.addWordUseCase,
  }) : super(VocabularyInitial()) {
    on<LoadWords>(_onLoadWords);
    on<RefreshWords>(_onRefreshWords);
    on<AddWord>(_onAddWord);
  }

  Future<void> _onLoadWords(LoadWords event, Emitter<VocabularyState> emit) async {
    emit(VocabularyLoading());
    try {
      final words = await getWordsUseCase();
      if (words.isEmpty) {
        emit(VocabularyEmpty());
      } else {
        emit(VocabularyLoaded(words));
      }
    } catch (e) {
      emit(VocabularyError(e.toString()));
    }
  }

  Future<void> _onRefreshWords(RefreshWords event, Emitter<VocabularyState> emit) async {
    try {
      final words = await getWordsUseCase();
      if (words.isEmpty) {
        emit(VocabularyEmpty());
      } else {
        emit(VocabularyLoaded(words));
      }
    } catch (e) {
      emit(VocabularyError(e.toString()));
    }
  }

  Future<void> _onAddWord(AddWord event, Emitter<VocabularyState> emit) async {
    final currentState = state;
    List<VocabularyWord> currentWords = [];
    if (currentState is VocabularyLoaded) {
      currentWords = currentState.words;
    }

    emit(VocabularyAddingWord(currentWords));

    try {
      await addWordUseCase(
        word: event.word,
        meaning: event.meaning,
        translation: event.translation,
      );
      add(RefreshWords());
    } catch (e) {
      emit(VocabularyError(e.toString()));
      if (currentWords.isNotEmpty) {
      }
    }
  }
}
