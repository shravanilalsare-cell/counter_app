class StudentState {
  final int completedTasks;

  const StudentState({
    this.completedTasks = 0,
  });

  StudentState copyWith({
    int? completedTasks,
  }) {
    return StudentState(
      completedTasks: completedTasks ?? this.completedTasks,
    );
  }
}