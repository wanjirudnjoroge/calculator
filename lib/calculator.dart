import 'package:calculator/lifecycle.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _num1controller = TextEditingController();
  final _num2controller = TextEditingController();
  String _result = "";

  void _calculate(String operation) {
    final num1 = double.tryParse(_num1controller.text);
    final num2 = double.tryParse(_num2controller.text);

    if (num1 == null || num2 == null) {
      setState(() {
        _result = "Enter a valid number";
      });
      return;
    }

    setState(() {
      switch (operation) {
        case '+':
          _result = (num1 + num2).toString();
          break;
        case '-':
          _result = (num1 - num2).toString();
          break;
        case 'X':
          _result = (num1 * num2).toString();
          break;
        case '/':
          if (num2 == 0) {
            _result = "Cannot divide by zero";
          } else {
            _result = (num1 / num2).toString();
          }
          break;
      }
    });
  }

  void _clearAll() {
    setState(() {
      _num1controller.clear();
      _num2controller.clear();
      _result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'First Number'),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _num2controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Second Number'),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(label: '+', onPressed: () => _calculate('+')),
                CalculatorButton(label: '-', onPressed: () => _calculate('-')),
                CalculatorButton(label: 'X', onPressed: () => _calculate('X')),
                CalculatorButton(label: '/', onPressed: () => _calculate('/')),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _clearAll,
              child: const Text('Clear'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CounterScreen()),
                );
              },
              child: const Text('Go to Lifecycle Screen'),
            ),
            const SizedBox(height: 24),
            Text(
              _result,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CalculatorButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(label));
  }
}
