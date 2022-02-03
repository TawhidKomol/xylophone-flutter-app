import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  void playSound(int num) {
    final player = AudioCache();
    player.play('note$num.wav');
  }

  Widget getView(int position, Color color, String text) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
        ),
        onPressed: () {
          playSound(position);
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Xylophone'),
          backgroundColor: Colors.purple,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getView(1, Colors.red, 'C'),
              getView(2, Colors.deepOrangeAccent, 'D'),
              getView(3, Colors.orange, 'E'),
              getView(4, Colors.green, 'F'),
              getView(5, Colors.teal, 'G'),
              getView(6, Colors.deepPurpleAccent, 'A'),
              getView(7, Colors.deepPurple, 'B'),
            ],
          ),
        ),
      ),
    );
  }
}
