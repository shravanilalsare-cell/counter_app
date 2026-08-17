import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/student_bloc.dart';
import '../bloc/student_event.dart';
import '../bloc/student_state.dart';

class TaskCounter extends StatelessWidget {
  const TaskCounter({super.key});

  String getStatus(int tasks) {
    if (tasks == 0) {
      return 'No tasks completed';
    } else if (tasks <= 4) {
      return 'Good Start!';
    } else {
      return 'Excellent!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        final tasks = state.completedTasks;

        return Column(
          children: [
            const Text(
              'Task Counter',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Completed Tasks: $tasks',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              getStatus(tasks),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: tasks == 0
                    ? Colors.grey
                    : tasks <= 4
                        ? Colors.orange
                        : Colors.green,
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<StudentBloc>().add(AddTask());
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Task'),
                ),

                const SizedBox(width: 12),

                ElevatedButton.icon(
                  onPressed: tasks == 0
                      ? null
                      : () {
                          context
                              .read<StudentBloc>()
                              .add(RemoveTask());
                        },
                  icon: const Icon(Icons.remove),
                  label: const Text('Remove Task'),
                ),
              ],
            ),

            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: tasks == 0
                  ? null
                  : () {
                      context.read<StudentBloc>().add(ResetTasks());
                    },
              icon: const Icon(Icons.refresh),
              label: const Text('Reset Tasks'),
            ),
          ],
        );
      },
    );
  }
}