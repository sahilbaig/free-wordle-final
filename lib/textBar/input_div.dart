import 'package:flutter/material.dart';
import 'package:free_wordle/utilities/word_of_the_day.dart';

class TextBoxes extends StatefulWidget {
  WordOfTheDay word; // Accept WordOfTheDay instance
  TextBoxes({super.key, required this.word});

  @override
  State<TextBoxes> createState() => _TextBoxesState();
}

class _TextBoxesState extends State<TextBoxes> {
  final textController = List.generate(5, (index) => TextEditingController());
  final focusNodes = List.generate(5, (index) => FocusNode());
  List<Color> containerColors = List.generate(5, (index) => Colors.white);

  void moveForward(value, index) {
    if (value.isNotEmpty && index < 4) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
  }

  void colorDiv() {
    List<String> wordCharacters = widget.word.getWord().split("");
    List<TextEditingController> inputData = List.from(textController);
    Set<int> alreadyChecked = {};

    for (int i = 0; i < inputData.length; i++) {
      setState(() {
        containerColors[i] = Colors.redAccent;
      });
    }

    for (int i = inputData.length - 1; i >= 0; i--) {
      // Iterate in reverse
      if (inputData[i].text == wordCharacters[i]) {
        wordCharacters[i] = "1234";
        setState(() {
          containerColors[i] = Colors.greenAccent;
        });
        alreadyChecked.add(i);
      }
    }

    for (int i = 0; i < inputData.length; i++) {
      if (!alreadyChecked.contains(i)) {
        for (int j = 0; j < wordCharacters.length; j++) {
          if (inputData[i].text == wordCharacters[j]) {
            wordCharacters[j] = "1234"; // ✅ Mark as used
            alreadyChecked.add(i);
            setState(() {
              containerColors[i] = Colors.yellowAccent;
            });
            break;
          }
        }
      }
    }
  }

  void moveBackwards() {
    // TODO: Implement this method -> Backspace does not work;
  }

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
              if (value.isNotEmpty) {
                moveForward(value, index);
              }
              //Add a method to go backwords
            },
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTextFields(),
        ElevatedButton(
            onPressed: () {
              colorDiv();
            },
            child: Text("Check"))
      ],
    );
  }
}
