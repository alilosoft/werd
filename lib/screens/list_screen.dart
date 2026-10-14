import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../data/adhkar_data.dart';
import '../providers/dhikr_provider.dart';
import '../theme.dart';

class ListScreen extends ConsumerWidget {
  final String categoryId;

  const ListScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = AdhkarData.categories.firstWhere((c) => c.id == categoryId);
    final adhkarList = AdhkarData.categoryAdhkar[categoryId] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Container(
        color: AppTheme.backgroundLight,
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: adhkarList.length,
          itemBuilder: (context, index) {
            final dhikr = adhkarList[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: AppTheme.emeraldGreen.withOpacity(0.2), width: 1),
              ),
              child: InkWell(
                onTap: () {
                  ref.read(currentDhikrProvider.notifier).setDhikr(dhikr.copyWith(currentCount: 0));
                  context.push('/counter');
                },
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        dhikr.text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Divider(color: AppTheme.goldenBrown.withOpacity(0.5)),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.repeat, color: AppTheme.goldenBrown, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'التكرار: ${dhikr.targetCount}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.goldenBrown,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
