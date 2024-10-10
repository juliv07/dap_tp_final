// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_final_dap/entities/Album.dart';
import 'package:tp_final_dap/presentation/album_detail_screen.dart';
import 'package:tp_final_dap/presentation/home_screen.dart';
import 'package:tp_final_dap/providers/albumProvider.dart';

class EditAlbumScreen extends ConsumerWidget {
  static const String name = 'edit_album_screen';

  EditAlbumScreen({super.key,});

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();
  final focusNode5 = FocusNode();
  final focusNode6 = FocusNode();
    
  final formKey = GlobalKey<FormState>();

  final isNumeric = RegExp(r'^[0-9]+$');

  @override
  Widget build(BuildContext context, ref) {

    Album album = ref.watch(currentAlbum);

    final int selectedAlbumIndex = ref.watch(selectedAlbumIndexProvider);

    TextEditingController albumNameController = TextEditingController(text: album.albumName);
    TextEditingController artistController = TextEditingController(text: album.artist);
    TextEditingController yearController = TextEditingController(text: album.year.toString());
    TextEditingController descriptionController = TextEditingController(text: album.description);
    TextEditingController imgURLController = TextEditingController(text: album.imgURL);

    return Scaffold(
      appBar: AppBar(title: const Text('Album configuration')),

      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Form(
              key: formKey, 
              child: Column(
                children: [
                  Text('Editar ${album.albumName}'),
                  
                  const SizedBox(height: 30),
              
                  TextFormField(
                    focusNode: focusNode1,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode2);
                    },
                    controller: albumNameController,
                    decoration: const InputDecoration(
                      hintText: 'Nombre del álbum',
                      icon: Icon(Icons.album)
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } 
                      return null; // Devuelve null si no hay error
                    },
                  ),

                  TextFormField(
                    focusNode: focusNode2,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode3);
                    },
                    controller: artistController,
                    decoration: const InputDecoration(
                      hintText: 'Artista',
                      icon: Icon(Icons.person)
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } 
                      return null; // Devuelve null si no hay error
                    },
                  ),

                  TextFormField(
                    focusNode: focusNode3,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode4);
                    },
                    controller: yearController,
                    decoration: const InputDecoration(
                      hintText: 'Año de publicación',
                      icon: Icon(Icons.date_range)
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } 
                      else if (isNumeric.hasMatch(value)==false) {
                        return 'Este campo sólo admite números';
                      }
                      return null; // Devuelve null si no hay error
                    },
                  ),

                  TextFormField(
                    focusNode: focusNode4,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode5);
                    },
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      hintText: 'Descripción',
                      icon: Icon(Icons.description)
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } 
                      return null; // Devuelve null si no hay error
                    },
                  ),

                  TextFormField(
                    focusNode: focusNode5,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focusNode6);
                    },
                    controller: imgURLController,
                    decoration: const InputDecoration(
                      hintText: 'Cover (url)',
                      icon: Icon(Icons.image)
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } 
                      return null; // Devuelve null si no hay error
                    },
                  ),

                  ElevatedButton(
                    focusNode: focusNode6,
                    onPressed: () async {
                      if (formKey.currentState?.validate() ?? false) {
                      
                        final Album newAlbum = Album(
                          albumName: albumNameController.text, 
                          artist: artistController.text, 
                          description: descriptionController.text, 
                          imgURL: imgURLController.text, 
                          year: int.parse(yearController.text), 
                          albumId: album.albumId
                        );
                        
                        await ref.read(albumProvider.notifier).deleteAlbum(album.albumId);
                        await ref.read(albumProvider.notifier).addAlbum(newAlbum);
                        
                        ref.read(albumProvider.notifier).state[selectedAlbumIndex] = newAlbum;
                         ref.read(albumProvider.notifier).state = [];

                        context.goNamed(HomeScreen.name);
                      }
                    },
                    child: const Text('Editar')
                  ),
              
                ],
              ),
          )
        ),
      ),
    );
  }
}