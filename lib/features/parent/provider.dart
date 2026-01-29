import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// ---------- State ----------
class BottomNavState {
  final int currentIndex;
  BottomNavState({this.currentIndex = 0});
}

// ---------- StateNotifier ----------
class BottomNavNotifier extends StateNotifier<BottomNavState> {
  BottomNavNotifier() : super(BottomNavState());

  void updateIndex(int index) {
    state = BottomNavState(currentIndex: index);
  }
}

// ---------- Provider ----------
final bottomNavProvider = StateNotifierProvider<BottomNavNotifier, BottomNavState>(
      (ref) => BottomNavNotifier(),
);
