import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorButton(color: Colors.red, name: 'Красный'),
            ColorButton(color: Colors.yellow, name: 'Желтый'),
            ColorButton(color: Colors.blue, name: 'Синий'),
          ],
        ),
      ),
    );
  }
}

class ColorButton extends StatelessWidget {
  final Color color;
  final String name;

  const ColorButton({required this.color, required this.name});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondScreen(color: color),
          ),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
      child: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final Color color;

  const SecondScreen({required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Container(
        color: color,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Вернуться'),
          ),
        ),
      ),
    );
  }
}
