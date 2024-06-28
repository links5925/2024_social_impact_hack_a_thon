import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameChange extends StateNotifier<int> {
  NameChange() : super(0);

  void setPage(int value) async {
    state = value;
  }
}

final pageChangeStateNotifierProvider =
    StateNotifierProvider<NameChange, int>((ref) {
  return NameChange();
});
