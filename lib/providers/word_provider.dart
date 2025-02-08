import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// WordNotifier that manages the word state
class WordNotifier extends StateNotifier<String> {
  final List<String> wordleWords = [
    "Crane",
    "Slate",
    "Brick",
    "Flame",
    "Charm",
    "Grasp",
    "Spine",
    "Bread",
    "Glint",
    "Shine",
    "Frost",
    "Plumb",
    "Mirth",
    "Bloat",
    "Crush",
    "Trick",
    "Lapse",
    "Mound",
    "Chirp",
    "Quirk",
    "Blaze",
    "Sworn",
    "Gripe",
    "Tonic",
    "Woven",
    "Probe",
    "Haste",
    "Flick",
    "Vapor",
    "Jolly"
  ];

  WordNotifier() : super(_getRandomWord());

  // Function to generate a new random word
  static String _getRandomWord() {
    return [
      "Crane",
      "Slate",
      "Brick",
      "Flame",
      "Charm",
      "Grasp",
      "Spine",
      "Bread",
      "Glint",
      "Shine",
      "Frost",
      "Plumb",
      "Mirth",
      "Bloat",
      "Crush",
      "Trick",
      "Lapse",
      "Mound",
      "Chirp",
      "Quirk",
      "Blaze",
      "Sworn",
      "Gripe",
      "Tonic",
      "Woven",
      "Probe",
      "Haste",
      "Flick",
      "Vapor",
      "Jolly"
    ][Random().nextInt(30)];
  }

  void generateNewWord() {
    state = _getRandomWord(); // Update the state with a new random word
  }

  String getWord() {
    return state;
  }
}

final wordProvider = StateNotifierProvider<WordNotifier, String>((ref) {
  return WordNotifier();
});

final resetProvider = StateProvider<bool>((ref) {
  return false;
});
