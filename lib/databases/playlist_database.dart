import 'package:flutter_music_app/database%20model/playlist.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlaylistDatabase {
  //Info: Database -> playlists
  final database = Supabase.instance.client.from('playlists');

  //Note: Create
  Future createPlaylist(Playlist playlist) async {
    await database.insert(playlist.toMap());
  }

  //Note: Read nikolas
  final streamNikolas = Supabase.instance.client
      .from('playlists')
      .stream(primaryKey: ['id'])
      .eq('user', 'nikolas')
      .map((data) =>
          data.map((playlistMap) => Playlist.fromMap(playlistMap)).toList());

  //Note: Read terezka
  final streamTerezka = Supabase.instance.client
      .from('playlists')
      .stream(primaryKey: ['id'])
      .eq('user', 'terezka')
      .map((data) =>
          data.map((playlistMap) => Playlist.fromMap(playlistMap)).toList());

  //Note: Update
  Future updatePlaylist(Playlist oldPlaylist, String newPlaylist) async {
    await database.update({
      'name': newPlaylist,
    }).eq('id', oldPlaylist.id!);
  }

  //Note: Delete
  Future deletePlaylist(Playlist playlist) async {
    await database.delete().eq('id', playlist.id!);
  }
}
