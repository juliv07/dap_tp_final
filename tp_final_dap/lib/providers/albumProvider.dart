import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp_final_dap/entities/Album.dart';

final albumProvider = StateNotifierProvider<AlbumsNotifier, List<Album>>(
  (ref) => AlbumsNotifier(FirebaseFirestore.instance),
);

class AlbumsNotifier extends StateNotifier<List<Album>> {
  final FirebaseFirestore db;

  AlbumsNotifier(this.db) : super([]);

  Future<void> addMovie(Album album) async {
    final doc = db.collection('movies').doc();
    try {
      await doc.set(album.toFirestore());
      state = [...state, album];
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAllMovies() async {
    final docs = db.collection('movies').withConverter(
        fromFirestore: Album.fromFirestore,
        toFirestore: (Album movie, _) => movie.toFirestore());
    final movies = await docs.get();
    state = [...state, ...movies.docs.map((d) => d.data())];
  }
}
