import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  final int completedTasks;

  const StudentCard({
    super.key,
    required this.completedTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Student Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Student Name: John Doe',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Course: Flutter Development',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Completed Tasks: $completedTasks',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}