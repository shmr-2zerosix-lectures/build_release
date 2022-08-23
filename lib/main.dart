import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CounterController extends ValueNotifier<int> {
  CounterController({int initialValue = 0}) : super(initialValue);

  void increment() {
    ++value;
  }

  void decrement() {
    --value;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counter = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder<int>(
              valueListenable: counter,
              builder: (context, value, _) => Text(
                '$value',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ValueListenableBuilder<int>(
              valueListenable: counter,
              builder: (context, value, _) => AnimatedContainer(
                height: 100,
                width: 100,
                key: const ValueKey('first'),
                duration: const Duration(seconds: 1),
                color: value % 2 == 0 ? Colors.red : Colors.blue,
              ),
            ),
            ValueListenableBuilder<int>(
              valueListenable: counter,
              builder: (context, value, _) => AnimatedContainer(
                height: 100,
                width: 100,
                key: const ValueKey('second'),
                duration: const Duration(seconds: 1),
                color: value % 2 == 1 ? Colors.red : Colors.blue,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
