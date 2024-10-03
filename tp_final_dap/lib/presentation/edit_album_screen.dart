import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp_final_dap/entities/Album.dart';

class EditAlbumScreen extends ConsumerWidget {
  static const String name = 'edit_album_screen';

  final String albumId;
  Album? album;

  EditAlbumScreen({super.key, required this.albumId, this.album});

  @override
  Widget build(BuildContext context, ref) {
    return const Placeholder();
  }
}