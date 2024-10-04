import 'package:cloud_firestore/cloud_firestore.dart';

class Album{
  String albumName;
  String artist;
  String description;
  String imgURL;
  int year;
  String albumId;

Album({
  required this.albumName,
  required this.artist,
  required this.description,
  required this.imgURL,
  required this.year,
  required this.albumId,
});

  Map<String, dynamic> toFirestore() {
    return {
      'albumName': albumName,
      'artist': artist,
      'description': description,
      'imgURL': imgURL,
      'year': year,
      'albumId': albumId,
    };
  }

  static Album fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return Album(
      albumName: data?['albumName'],
      artist: data?['artist'],
      description: data?['description'],
      imgURL: data?['imgURL'],
      year: data?['year'],
      albumId: data?['albumId'],
    );
  }

}