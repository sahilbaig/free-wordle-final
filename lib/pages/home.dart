import 'package:flutter/material.dart';
import 'package:free_wordle/pages/text_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Free Wordle"),
      ),
      body: Column(
        children: [TextBar()],
      ),
    );
  }
}
