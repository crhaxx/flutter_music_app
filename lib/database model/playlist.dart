class Playlist {
  int? id;
  String name;
  String user;

  Playlist({
    this.id,
    required this.name,
    required this.user,
  });

  //Info: map -> playlist
  factory Playlist.fromMap(Map<String, dynamic> map) {
    return Playlist(
      id: map['id'] as int?,
      name: map['name'] as String,
      user: map['user'] as String,
    );
  }

  //Info: playlist -> map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'user': user,
    };
  }
}
