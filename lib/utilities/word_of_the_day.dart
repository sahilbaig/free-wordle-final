class WordOfTheDay {
  String wordofDay = "";

  WordOfTheDay() {
    wordofDay = "hinge";
  }

  String getWord() {
    return wordofDay;
  }

  String resetWord() {
    wordofDay = "random";
    return wordofDay;
  }
}
