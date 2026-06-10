import 'package:flutter/material.dart';
import '../../features/vocabulary/domain/entities/vocabulary_word.dart';

class VocabularyCard extends StatelessWidget {
  final VocabularyWord word;

  const VocabularyCard({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24), // Increased padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06), // Slightly more visible shadow
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            word.word,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 24, // Larger font size
                  fontWeight: FontWeight.bold, // Bold emphasis
                  color: Colors.black87,
                ),
          ),
          const SizedBox(height: 20), // More vertical spacing
          _buildInfoSection(context, 'Meaning', word.meaning, isTranslation: false),
          const SizedBox(height: 16), // More vertical spacing
          _buildInfoSection(context, 'Translation', word.translation, isTranslation: true),
        ],
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context, String label, String value, {required bool isTranslation}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.grey.shade600,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: isTranslation ? FontWeight.w500 : FontWeight.normal,
                color: isTranslation ? Theme.of(context).colorScheme.primary : Colors.black87,
                fontSize: 16,
              ),
        ),
      ],
    );
  }
}
