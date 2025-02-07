import 'dart:math';

import 'package:flutter/material.dart';
import 'package:free_wordle/models/character_map.dart';

class TextBar extends StatefulWidget {
  const TextBar({super.key});
  static const String CorrectWord = "hello";

  @override
  State<TextBar> createState() => _TextBarState();
}

class _TextBarState extends State<TextBar> {
  final textController = List.generate(5, (index) => TextEditingController());
  final focusNodes = List.generate(5, (index) => FocusNode());
  final correctWord = "meow".toLowerCase();
  List<Color> containerColors = List.generate(5, (index) => Colors.white);

  Widget _buildTextFields() {
    return Row(
      children: List.generate(5, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              color: containerColors[index]),
          width: 40,
          child: TextField(
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            controller: textController[index],
            maxLength: 1,
            decoration: InputDecoration(counterText: ""),
            onChanged: (value) {
              if (value.isNotEmpty && index < 4) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              }
            },
          ),
        );
      }),
    );
  }

  void reset(i) {
    setState(() {
      containerColors[i] = Colors.redAccent;
    });
  }

  void getWord() {
    List<String> correct_word_converted_to_list = TextBar.CorrectWord.split("");
    List<characterMap> Correct_word_data = [];

    for (int i = 0; i < correct_word_converted_to_list.length; i++) {
      int index = Correct_word_data.indexWhere(
          (item) => item.name == correct_word_converted_to_list[i]);

      if (index != -1) {
        // If character exists, update its countLeft and add new position
        Correct_word_data[index].countLeft += 1;
        Correct_word_data[index].positions.add(i);
      } else {
        // If character doesn't exist, create a new object
        var character_to_push =
            characterMap(correct_word_converted_to_list[i], [i], 1);
        Correct_word_data.add(character_to_push);
      }
    }

    for (int i = 0; i < textController.length; i++) {
      // right character && right place ==  color = red
      bool characterExists =
          Correct_word_data.any((item) => item.name == textController[i].text);

      if (characterExists) {
        // Find the characterMap object where the name matches textController[i].text
        var characterData = Correct_word_data.firstWhere(
            (item) => item.name == textController[i].text);
        characterData.countLeft--;

        if (characterData.countLeft <= 0) {
          print("goes here");
          setState(() {
            containerColors[i] = Colors.redAccent;
          });
        }

        if (characterData.positions.contains(i)) {
          setState(() {
            containerColors[i] = Colors.greenAccent;
          });
        } else {
          setState(() {
            containerColors[i] = Colors.yellowAccent;
          });
        }
      } else {
        setState(() {
          containerColors[i] = Colors.redAccent;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTextFields(),
        ElevatedButton(
            onPressed: () {
              getWord();
            },
            child: Text("check"))
      ],
    );
  }
}
