import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listen_bloc_test/domain/state/counter_cubit.dart';


class DistTestCubit extends Cubit<int> {
  DistTestCubit(this.counterCubit) : super(0) {
    _subscription = counterCubit.stream.distinct(
      (previous, next) {
        return previous == next;
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
