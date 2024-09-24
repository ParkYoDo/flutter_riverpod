import 'package:flutter_riverpod/flutter_riverpod.dart';

// family Modifier : initial State를 만들 때 특정 데이터를 주입
final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(const Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});
