class NumberEntity {
  String number;
  String text;
  String audio;

  NumberEntity({
    required this.text,
    required this.audio, 
    required this.number,
  });

  factory NumberEntity.fromJson(Map<String, dynamic> parsedJson) {
    return NumberEntity(
      number: parsedJson['word'],
      text: parsedJson['number'],
      audio: parsedJson['audio'],
    );
  }
}
