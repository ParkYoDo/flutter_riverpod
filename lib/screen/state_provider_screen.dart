import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/layout/default_layout.dart';
import 'package:state/riverpod/state_provider_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(numberProvider.notifier)
                        .update((state) => state + 1);
                  },
                  child: const Text('UP')),
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier).state -= 2;
                  },
                  child: const Text('UP')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const _NextScreen()));
                  },
                  child: const Text('NEXT SCREEN'))
            ],
          ),
        ));
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(numberProvider.notifier)
                        .update((state) => state + 1);
                  },
                  child: const Text('UP')),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(numberProvider.notifier)
                        .update((state) => state - 1);
                  },
                  child: const Text('DOWN'))
            ],
          ),
        ));
  }
}
