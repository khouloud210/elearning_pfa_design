class AlphabetEntity {
  String text;
  String word;
  String audio;

  AlphabetEntity({
    required this.text,
    required this.audio,
    required this.word,
  });

  factory AlphabetEntity.fromJson(Map<String, dynamic> parsedJson) {
    return AlphabetEntity(
      text: parsedJson['text'],
      word: parsedJson['word'],
      audio: parsedJson['audio'],
    );
  }
}
