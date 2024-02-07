import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

class CounterEvent {}

class CounterIncrement extends CounterEvent {}

class CounterDecrement extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrement>((event, emit) => emit(state + 1));
    on<CounterDecrement>((event, emit) => emit(state - 1));
  }
}

void main(List<String> arguments) {
  final bloc = CounterBloc();
  bloc.stream.listen(print);
  bloc.add(CounterIncrement());
  bloc.add(CounterIncrement());
  bloc.add(CounterDecrement());
  bloc.close();

  // final cubit = CounterCubit();
  // cubit.stream.listen(print);
  // cubit.increment();
  // cubit.increment();
  // cubit.decrement();
  // cubit.close();
}
