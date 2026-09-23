import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void increment() { 
    setState(() {
      _counter += 1;
    });
  }

  @override
  void initState() {
    print("initState");
    _counter = 0;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant CounterScreen oldWidget) {
    print("didUpdateWidget triggered");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lifecycle Demo')),
      body: Container(
        child: Column(
          children: [
            Text(_counter.toString()),
            ElevatedButton(onPressed: increment, child: const Text('Increment'))
          ],
        ),
      ),
    );
  }
}
