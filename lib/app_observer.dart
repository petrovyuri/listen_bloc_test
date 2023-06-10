import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listen_bloc_test/domain/state/counter_cubit.dart';

class AppObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    if (bloc is CounterCubit) {
      if (change.currentState != 0) {
        print(change);
      }
    }
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    print(transition);
  }
}
