import 'package:counter_bloc/models/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(super.initialState);

  void increment() => emit(CounterState(state.counter + 1, true));
  void decrement() => state.counter > 0
      ? emit(CounterState(state.counter - 1, false))
      : emit(CounterState(0, false));
}
