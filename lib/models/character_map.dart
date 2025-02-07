// class characterMap {
//   String name;
//   List<int> positions;
//   int countLeft;

//   static num length;
//   characterMap(this.name, this.positions, this.countLeft);
// }


// if (characterExists) {
//         // Find the characterMap object where the name matches textController[i].text
//         var characterData = Correct_word_data.firstWhere(
//             (item) => item.name == textController[i].text);
//         characterData.countLeft--;

//         if (characterData.countLeft <= 0) {
//           print("goes here");
//           setState(() {
//             containerColors[i] = Colors.redAccent;
//           });
//         }

//         if (characterData.positions.contains(i)) {
//           setState(() {
//             containerColors[i] = Colors.greenAccent;
//           });
//         } else {
//           setState(() {
//             containerColors[i] = Colors.yellowAccent;
//           });
//         }
//       } else {
//         setState(() {
//           containerColors[i] = Colors.redAccent;
//         });
//       }