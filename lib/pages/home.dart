import 'package:flutter/material.dart';
import 'package:free_wordle/textBar/input_div.dart';
import 'package:free_wordle/utilities/word_of_the_day.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final WordOfTheDay word = WordOfTheDay(); // Define word first

  @override
  Widget build(BuildContext context) {
    // Now we can generate wordRows inside build()
    final wordRows = List.generate(5, (index) {
      return TextBoxes(word: word);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Free Wordle"),
      ),
      body: Column(
        children: [
          ...wordRows, // Spread operator to add list elements
          ElevatedButton(
            onPressed: () {
              word.resetWord();
              print(word.getWord());
            },
            child: const Text("Get new word"),
          ),
        ],
      ),
    );
  }
}
