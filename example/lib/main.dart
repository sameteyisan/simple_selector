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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleSelector(
              radius: 0,
              selectedIndex: selected,
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
              indicatorColor: selected == 0
                  ? const Color(0xff2980b9)
                  : const Color(0xff2980b9).withValues(alpha: 0.5),
              itemExtent: 60,
              height: 35,
              onChanged: (selectedIndex) {
                setState(() {
                  selected = selectedIndex;
                });
              },
            ),
            const SizedBox(height: 32),
            SimpleSelector(
              selectedIndex: selected,
              dense: true,
              radius: 0,
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
              indicatorColor: selected == 0
                  ? const Color(0xff2980b9)
                  : const Color(0xff2980b9).withValues(alpha: 0.6),
              itemExtent: 60,
              height: 35,
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
