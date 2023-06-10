import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listen_bloc_test/domain/state/counter_cubit.dart';

class ListenTestCubit extends Cubit<int> {
  ListenTestCubit(this.counterCubit) : super(0) {
    _subscription = counterCubit.stream.distinct(
      (previous, next) {
        return next != 5;
      },
    ).listen((state) {
      print(state);
    });
  }

  final CounterCubit counterCubit;
  late StreamSubscription<int> _subscription;

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
