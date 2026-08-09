import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter/counter_bloc.dart';
import 'bloc/counter/counter_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BLOC Counter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, CounterState>(
      listener: (context, state) {
        if (state.counter == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Counter Reset!'),
            ),
          );
        }

        if (state.counter == 10) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Maximum limit reached'),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BLOC Counter'),
          centerTitle: true,
        ),
        body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Counter',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    '${state.counter}',
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: state.counter == 10
                            ? null
                            : () {
                                context
                                    .read<CounterBloc>()
                                    .add(Increment());
                              },
                        child: const Text('➕ Increment'),
                      ),

                      const SizedBox(width: 10),

                      ElevatedButton(
                        onPressed: state.counter == 0
                            ? null
                            : () {
                                context
                                    .read<CounterBloc>()
                                    .add(Decrement());
                              },
                        child: const Text('➖ Decrement'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<CounterBloc>()
                          .add(Reset());
                    },
                    child: const Text('🔄 Reset'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}