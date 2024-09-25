import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/riverpod/provider_observer.dart';
import 'package:state/screen/home_screen.dart';

void main() {
  runApp(ProviderScope(
    observers: [Logger()],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  ));
}
