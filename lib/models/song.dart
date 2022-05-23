class Song {
  final String title;
  final String text;
  final List<dynamic> chords;

  Song({
    required this.title,
    required this.text,
    required this.chords,
  });

  factory Song.fromJson(Map<String, dynamic> map) => Song(
      title: map['title'],
      text: map['text'],
      chords: map['chords'] as List<dynamic>);
}
