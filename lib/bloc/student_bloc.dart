import 'package:flutter_bloc/flutter_bloc.dart';

import 'student_event.dart';
import 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(const StudentState()) {
    on<AddTask>(_onAddTask);
    on<RemoveTask>(_onRemoveTask);
    on<ResetTasks>(_onResetTasks);
  }

  void _onAddTask(
    AddTask event,
    Emitter<StudentState> emit,
  ) {
    emit(
      state.copyWith(
        completedTasks: state.completedTasks + 1,
      ),
    );
  }

  void _onRemoveTask(
    RemoveTask event,
    Emitter<StudentState> emit,
  ) {
    if (state.completedTasks > 0) {
      emit(
        state.copyWith(
          completedTasks: state.completedTasks - 1,
        ),
      );
    }
  }

  void _onResetTasks(
    ResetTasks event,
    Emitter<StudentState> emit,
  ) {
    emit(
      state.copyWith(
        completedTasks: 0,
      ),
    );
  }
}