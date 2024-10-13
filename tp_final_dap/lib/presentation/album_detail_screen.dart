// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_final_dap/entities/Album.dart';
import 'package:tp_final_dap/presentation/edit_album_screen.dart';
import 'package:tp_final_dap/presentation/home_screen.dart';
import 'package:tp_final_dap/providers/albumProvider.dart';

class AlbumDetailScreen extends ConsumerWidget {
  static const String name = 'album_detail';

  AlbumDetailScreen({super.key});


  @override
  Widget build(BuildContext context, ref) {

    Album album = ref.watch(currentAlbum);
    
    return Scaffold(
      appBar: AppBar(title: Text(album.albumName),),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Image.network(
                  album.imgURL,
                  errorBuilder: (contex, error, stackTrace){
                    return const Icon (Icons.hide_image_outlined);
                  },
                ),
                const SizedBox(height: 30),
                Text('${album.albumName} (${album.year})', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                const SizedBox(height: 5),
                Text(album.artist, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                Text(album.description),
                const SizedBox(height: 30,),

                ElevatedButton(
                  onPressed: (){
                    context.pushNamed(EditAlbumScreen.name);
                  }, 
                  child: const Text('Editar'),
                ),
                ElevatedButton(
                  onPressed: () async{
                    ref.read(albumProvider.notifier).deleteAlbum(album.albumId);
                    ref.read(albumProvider.notifier).state = [];
                    context.goNamed(HomeScreen.name);
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(color: Colors.white)
                  ),
                  child: const Text('Eliminar') 
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}