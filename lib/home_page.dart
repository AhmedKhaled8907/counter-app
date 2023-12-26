import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:counter_app/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*
  The issue in your code is that you are creating
  a new instance of CounterCubit each time you call
  CounterCubit() in the BlocBuilder and the onPressed callback.
  This means that the BlocBuilder is listening to
  a different instance of CounterCubit than the one
  you are incrementing in the onPressed callback.

  To fix this, you should use the same instance of CounterCubit
  in both places. Create an instance of CounterCubit
  in the State of your widget and use that instance consistently.
  */
  @override
  Widget build(BuildContext context) {
  final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, int>(
              bloc: counterCubit,
              builder: (context, counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const IncDecPage(),
            ),
          );
        },
          child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
