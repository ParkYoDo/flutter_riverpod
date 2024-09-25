import 'package:riverpod_annotation/riverpod_annotation.dart' hide Provider;

part 'code_generation_provider.g.dart';

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
