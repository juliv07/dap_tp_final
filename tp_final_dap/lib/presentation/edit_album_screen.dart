// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp_final_dap/entities/Album.dart';

class EditAlbumScreen extends ConsumerWidget {
  static const String name = 'edit_album_screen';

  final String albumId;
  Album? album;

  EditAlbumScreen({super.key, required this.albumId, this.album});

  TextEditingController albumNameController = TextEditingController();
  TextEditingController artistController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imgURLController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    return const Placeholder();
  }
}