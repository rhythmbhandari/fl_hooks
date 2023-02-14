import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();
    final text = useState('');
    useEffect(
      () {
        textEditingController.addListener(() {
          text.value = textEditingController.text;
        });
        return null;
      },
      [textEditingController],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home page',
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: textEditingController,
          ),
          Text('You types ${text.value}'),
        ],
      ),
    );
  }
}
