import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/dhikr_provider.dart';
import '../theme.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentDhikr = ref.watch(currentDhikrProvider);

    if (currentDhikr == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('لم يتم تحديد ذكر')),
      );
    }

    final isCompleted = currentDhikr.currentCount >= currentDhikr.targetCount;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              ref.read(currentDhikrProvider.notifier).reset();
            },
          )
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          ref.read(currentDhikrProvider.notifier).increment();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppTheme.emeraldGreen.withValues(alpha: 0.9),
                AppTheme.goldenBrown.withValues(alpha: 0.8),
                AppTheme.backgroundDark,
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: AppTheme.goldenBrown.withValues(alpha: 0.5), width: 2),
                          ),
                          child: Text(
                            currentDhikr.text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              height: 1.8,
                              shadows: [
                                Shadow(
                                  blurRadius: 4.0,
                                  color: Colors.black54,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 180,
                        height: 180,
                        child: CircularProgressIndicator(
                          value: currentDhikr.targetCount > 0
                              ? currentDhikr.currentCount / currentDhikr.targetCount
                              : 0,
                          strokeWidth: 8,
                          backgroundColor: Colors.white.withValues(alpha: 0.2),
                          valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.goldenBrown),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '${currentDhikr.currentCount}',
                            style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: isCompleted ? AppTheme.goldenBrown : Colors.white,
                              shadows: const [
                                Shadow(blurRadius: 8.0, color: Colors.black54, offset: Offset(2.0, 2.0)),
                              ],
                            ),
                          ),
                          Text(
                            'من ${currentDhikr.targetCount}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  if (isCompleted)
                    ElevatedButton.icon(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.check, color: AppTheme.emeraldGreen),
                      label: const Text('إتمام والعودة', style: TextStyle(color: AppTheme.emeraldGreen, fontSize: 18, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    )
                  else
                    const Text(
                      'اضغط على الشاشة للتسبيح',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white54,
                      ),
                    ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
