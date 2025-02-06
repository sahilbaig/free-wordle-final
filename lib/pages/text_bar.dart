import 'package:flutter/material.dart';

class TextBar extends StatefulWidget {
  const TextBar({super.key});
  static const String CorrectWord = "Msow";

  @override
  State<TextBar> createState() => _TextBarState();
}

class _TextBarState extends State<TextBar> {
  final textController = List.generate(5, (index) => TextEditingController());
  final focusNodes = List.generate(5, (index) => FocusNode());
  final correctWord = "meow".toLowerCase();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
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
}
