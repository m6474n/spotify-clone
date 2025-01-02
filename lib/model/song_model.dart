class Song {
  int? id;
  String title;
  String path;
  String? artist;
  int? duration;  // Duration in seconds

  Song({
    this.id,
    required this.title,
    required this.path,
     this.artist,
     this.duration,
  });

  // Convert Song to a Map (for SQLite insert)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'path': path,
      'artist': artist,
      'duration': duration,  // Add duration to the map
    };
  }

  // Convert Map to Song (for SQLite query)
  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      id: map['id'],
      title: map['title'],
      path: map['path'],
      artist: map['artist'],
      duration: map['duration'],  // Retrieve duration from the map
    );
  }
}
