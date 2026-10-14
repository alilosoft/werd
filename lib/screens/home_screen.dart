import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/adhkar_data.dart';
import '../theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أوراد اليوم والليلة', style: TextStyle(fontFamily: 'Amiri', fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppTheme.backgroundLight,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.85,
            ),
            itemCount: AdhkarData.categories.length,
            itemBuilder: (context, index) {
              final category = AdhkarData.categories[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: AppTheme.goldenBrown.withOpacity(0.3), width: 1),
                ),
                child: InkWell(
                  onTap: () {
                    context.push('/list/${category.id}');
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          AppTheme.backgroundLight,
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          category.icon,
                          style: const TextStyle(fontSize: 48),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          category.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.emeraldGreen,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          category.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
