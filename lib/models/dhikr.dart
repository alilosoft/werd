class Dhikr {
  final String id;
  final String text;
  final int targetCount;
  final int currentCount;

  Dhikr({
    required this.id,
    required this.text,
    required this.targetCount,
    this.currentCount = 0,
  });

  Dhikr copyWith({
    String? id,
    String? text,
    int? targetCount,
    int? currentCount,
  }) {
    return Dhikr(
      id: id ?? this.id,
      text: text ?? this.text,
      targetCount: targetCount ?? this.targetCount,
      currentCount: currentCount ?? this.currentCount,
    );
  }
}

class Category {
  final String id;
  final String title;
  final String description;
  final String icon;

  Category({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });
}
