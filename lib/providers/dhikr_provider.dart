import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dhikr.dart';

class CurrentDhikrNotifier extends Notifier<Dhikr?> {
  @override
  Dhikr? build() {
    return null;
  }

  void setDhikr(Dhikr dhikr) {
    state = dhikr;
  }

  void increment() {
    if (state != null) {
      if (state!.currentCount < state!.targetCount) {
        state = state!.copyWith(currentCount: state!.currentCount + 1);
      }
    }
  }

  void reset() {
    if (state != null) {
      state = state!.copyWith(currentCount: 0);
    }
  }
}

final currentDhikrProvider = NotifierProvider<CurrentDhikrNotifier, Dhikr?>(() {
  return CurrentDhikrNotifier();
});
