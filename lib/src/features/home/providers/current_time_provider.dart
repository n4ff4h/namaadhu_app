import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentTimeProvider =
    StateNotifierProvider<CurrentTimeNotifier, DateTime>((ref) {
  final controller = CurrentTimeNotifier(DateTime.now());

  ref.onDispose(() {
    controller.timer.cancel();
  });

  return controller;
});

class CurrentTimeNotifier extends StateNotifier<DateTime> {
  CurrentTimeNotifier(super.state) {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = DateTime.now();
    });
  }

  late final Timer timer;
}
