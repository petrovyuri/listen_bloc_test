import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listen_bloc_test/app_observer.dart';

import 'ui/counter_screen.dart';

void main() {
  Bloc.observer = AppObserver();
  runApp(const MaterialApp(home: CounterScreen()));
}
