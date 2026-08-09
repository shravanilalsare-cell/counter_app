import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';

class CounterState {
  final int counter;

  CounterState(this.counter);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    
    on<Increment>((event, emit) {
      if (state.counter < 10) {
        emit(CounterState(state.counter + 1));
      }
    });

    on<Decrement>((event, emit) {
      if (state.counter > 0) {
        emit(CounterState(state.counter - 1));
      }
    });

    on<Reset>((event, emit) {
      emit(CounterState(0));
    });
  }
}