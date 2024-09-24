import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/layout/default_layout.dart';
import 'package:state/riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(
        length: 10,
        vsync: this,
        initialIndex: ref.read(listenProvider.notifier).state);
  }

  @override
  Widget build(BuildContext context) {
    // watch는 state의 변경을 계속 감지할 때, read는 단발성으로 감지할 때, listen는 state의 변화애 따라 특정 함수를 실행할 때(useEffect와 유사)
    ref.listen<int>(listenProvider, (prev, next) {
      if (prev != next) {
        controller.animateTo(next);
      }
    });

    return DefaultLayout(
        title: 'ListenProviderScreen',
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: List.generate(
                10,
                (index) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(index.toString()),
                        ElevatedButton(
                            onPressed: () {
                              ref.read(listenProvider.notifier).update(
                                  (state) => state == 9 ? 9 : state + 1);
                            },
                            child: const Text('다음')),
                        ElevatedButton(
                            onPressed: () {
                              ref.read(listenProvider.notifier).update(
                                  (state) => state == 0 ? 0 : state - 1);
                            },
                            child: const Text('뒤로'))
                      ],
                    ))));
  }
}
