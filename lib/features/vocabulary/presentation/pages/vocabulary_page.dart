import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/vocabulary_bloc.dart';
import '../bloc/vocabulary_event.dart';
import '../bloc/vocabulary_state.dart';
import '../../../../core/widgets/vocabulary_card.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/loading_state_widget.dart';
import '../widgets/add_word_bottom_sheet.dart';

class VocabularyPage extends StatelessWidget {
  const VocabularyPage({super.key});

  void _showAddWordSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<VocabularyBloc>(),
          child: const AddWordBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('My Vocabulary'),
            BlocBuilder<VocabularyBloc, VocabularyState>(
              builder: (context, state) {
                int count = 0;
                if (state is VocabularyLoaded) {
                  count = state.words.length;
                } else if (state is VocabularyAddingWord) {
                  count = state.currentWords.length;
                }
                
                if (state is VocabularyLoaded || state is VocabularyAddingWord) {
                  return Text(
                    '$count saved word${count == 1 ? '' : 's'}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
      body: BlocConsumer<VocabularyBloc, VocabularyState>(
        listener: (context, state) {
          if (state is VocabularyError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is VocabularyInitial || state is VocabularyLoading) {
            return const LoadingStateWidget();
          } else if (state is VocabularyEmpty) {
            return EmptyStateWidget(
              onAddPressed: () => _showAddWordSheet(context),
            );
          } else if (state is VocabularyError) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => context.read<VocabularyBloc>().add(LoadWords()),
            );
          } else if (state is VocabularyLoaded || state is VocabularyAddingWord) {
            final words = state is VocabularyLoaded 
                ? state.words 
                : (state as VocabularyAddingWord).currentWords;

            return RefreshIndicator(
              onRefresh: () async {
                context.read<VocabularyBloc>().add(RefreshWords());
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: words.length,
                itemBuilder: (context, index) {
                  return VocabularyCard(word: words[index]);
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddWordSheet(context),
        icon: const Icon(Icons.add),
        label: const Text('Add Word'),
      ),
    );
  }
}
