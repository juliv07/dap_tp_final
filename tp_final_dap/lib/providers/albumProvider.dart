import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp_final_dap/entities/Album.dart';

final albumProvider = StateNotifierProvider<AlbumsNotifier, List<Album>>(
  (ref) => AlbumsNotifier(FirebaseFirestore.instance),
);

StateProvider<Album> currentAlbum = StateProvider((ref) => Album(albumName: 'albumName', artist: 'artist', description: 'description', imgURL: 'imgURL', year: 0, albumId: 'albumId'));

StateProvider<int> selectedAlbumIndexProvider = StateProvider((ref) => 0);

class AlbumsNotifier extends StateNotifier<List<Album>> {
  final FirebaseFirestore db;

  AlbumsNotifier(this.db) : super([]);

  Future<void> addAlbum(Album album) async {
    final doc = db.collection('albums').doc();
    try {
      await doc.set(album.toFirestore());
      state = [...state, album];
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteAlbum(String albumId) async {
    final doc = db.collection('albums').doc(albumId);
    try {
      await doc.delete();
      state = state.where((album) => album.albumId != albumId).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<void> editAlbum(String albumId, Album album) async {
    final doc = db.collection('albums').doc(albumId);

    final newDoc = {
      'albumName': album.albumId,
      'artist': album.artist,
      'year': album.year,
      'description': album.description,
      'imgURL': album.imgURL,
    };
    
    try {
      await doc.update(newDoc);
      state = state.map((d) => d.albumId == albumId ? album : d).toList();    
    } catch (e){
      print(e);
    }
  }

  Future<void> getAllAlbums() async {
    final docs = db.collection('albums').withConverter(
        fromFirestore: Album.fromFirestore,
        toFirestore: (Album album, _) => album.toFirestore());
    final album = await docs.get();
    state = [...state, ...album.docs.map((d) => d.data())];
  }
}
