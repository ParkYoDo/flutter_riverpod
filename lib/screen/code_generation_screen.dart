import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/layout/default_layout.dart';
import 'package:state/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(number1: 10, number2: 30));

    return DefaultLayout(
        title: 'CodeGenerationScreen',
        body: Column(
          children: [
            Text('state1 : $state1'),
            state2.when(
                data: (data) => Text(
                      'state2 : $data',
                      textAlign: TextAlign.center,
                    ),
                error: (err, stack) => Text(err.toString()),
                loading: () => const CircularProgressIndicator()),
            state3.when(
                data: (data) => Text(
                      'state3 : $data',
                      textAlign: TextAlign.center,
                    ),
                error: (err, stack) => Text(err.toString()),
                loading: () => const CircularProgressIndicator()),
            Text('state4 $state4'),
            const _StateFiveWidget(),
            Consumer(
              builder: (context, ref, child) {
                print('builder build');
                final state5 = ref.watch(gStateNotifierProvider);

                return Row(
                  children: [Text('state5: $state5'), if (child != null) child],
                );
              },
              child: const Text('hello'),
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref.read(gStateNotifierProvider.notifier).decrement();
                    },
                    child: const Text('decrement')),
                ElevatedButton(
                    onPressed: () {
                      ref.read(gStateNotifierProvider.notifier).increment();
                    },
                    child: const Text('increment')),
              ],
            ),
            // invalidate : provider state를 initialState로 변경
            ElevatedButton(
                onPressed: () {
                  ref.invalidate(gStateNotifierProvider);
                },
                child: const Text('invalidate'))
          ],
        ));
  }
}

class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);

    return Text('state5 $state5');
  }
}
