import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp_final_dap/entities/Album.dart';

final albumProvider = StateNotifierProvider<AlbumsNotifier, List<Album>>(
  (ref) => AlbumsNotifier(FirebaseFirestore.instance),
);

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

  Future<void> getAllAlbums() async {
    final docs = db.collection('albums').withConverter(
        fromFirestore: Album.fromFirestore,
        toFirestore: (Album album, _) => album.toFirestore());
    final album = await docs.get();
    state = [...state, ...album.docs.map((d) => d.data())];
  }
}
