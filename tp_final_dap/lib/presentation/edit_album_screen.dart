// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp_final_dap/entities/Album.dart';
import 'package:tp_final_dap/providers/albumProvider.dart';

class EditAlbumScreen extends ConsumerWidget {
  static const String name = 'edit_album_screen';

  EditAlbumScreen({super.key,});

  TextEditingController albumNameController = TextEditingController();
  TextEditingController artistController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imgURLController = TextEditingController();



  @override
  Widget build(BuildContext context, ref) {

    Album album = ref.watch(currentAlbum);

    return Scaffold(
      appBar: AppBar(title: const Text('Album configuration')),

      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              Text('Editar ${album.albumName}'),
              
              const SizedBox(height: 30),

              TextFormField()

            ],
          )
        ),
      ),
    );
  }
}