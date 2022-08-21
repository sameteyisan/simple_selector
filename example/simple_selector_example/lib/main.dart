import 'package:flutter/material.dart';
import 'package:simple_selector/simple_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Selector Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Selector Example"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SimpleSelector(
              items: const [
                Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                Icon(
                  Icons.lock_open,
                  color: Colors.white,
                ),
              ],
              indicatorColor: selected == 0 ? Colors.red : Colors.green,
              itemExtent: 60,
              height: 30,
              onChanged: (selectedIndex) {
                setState(() {
                  selected = selectedIndex;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
