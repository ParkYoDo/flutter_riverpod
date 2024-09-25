import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 Provider를 사용할지 고민할 필요 X

// final _testProvider = Provider((ref) => 'Hello Code Generation');

@riverpod
String gState(GStateRef ref) {
  return 'Hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(const Duration(seconds: 2));

  return 10;
}

@Riverpod(keepAlive: true)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(const Duration(seconds: 2));

  return 10;
}

// 2) Parameter : RiverPod에서는 Family

// class Parameter {
//   final int number1;
//   final int number2;

//   Parameter({required this.number1, required this.number2});
// }

// final _testFamilyProvider = Provider.family<int, Parameter>(
//     (ref, parameter) => parameter.number1 * parameter.number2);

@riverpod
int gStateMultiply(GStateMultiplyRef ref,
    {required int number1, required int number2}) {
  return number1 * number2;
}

@riverpod
class GStateNotifier extends _$GStateNotifier {
  @override
  int build() {
    return 0;
  }

  increment() {
    state++;
  }

  decrement() {
    state--;
  }
}
