import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wordle/providers/word_provider.dart';
import 'package:free_wordle/textBar/input_div.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Now we can generate wordRows inside build()

    return Scaffold(
      appBar: AppBar(
        title: const Text("Free Wordle"),
      ),
      body: Column(
        children: [
          TextBoxes(),
          TextBoxes(),
          TextBoxes(),
          TextBoxes(),
          TextBoxes(),
          ElevatedButton(
            onPressed: () {
              ref.read(wordProvider.notifier).generateNewWord();
            },
            child: const Text("Get new word"),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(resetProvider.notifier).state = true;
              Future.delayed(Duration(milliseconds: 50), () {
                ref.read(resetProvider.notifier).state = false;
              });
            },
            child: const Text("Reset"),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Final word"),
                    content: Text(ref.read(wordProvider.notifier).getWord()),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text("Reveal Word"),
          ),
        ],
      ),
    );
  }
}
