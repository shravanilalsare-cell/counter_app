import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/student_bloc.dart';
import 'bloc/student_state.dart';
import 'widgets/student_card.dart';
import 'widgets/task_counter.dart';

void main() {
  runApp(const StudentDashboardApp());
}

class StudentDashboardApp extends StatelessWidget {
  const StudentDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StudentBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Dashboard',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
          useMaterial3: true,
        ),
        home: const StudentDashboard(),
      ),
    );
  }
}

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        centerTitle: true,
      ),
      body: BlocBuilder<StudentBloc, StudentState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                StudentCard(
                  completedTasks: state.completedTasks,
                ),

                const SizedBox(height: 20),

                const TaskCounter(),
              ],
            ),
          );
        },
      ),
    );
  }
}