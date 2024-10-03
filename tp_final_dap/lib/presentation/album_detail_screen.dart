import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_final_dap/entities/Album.dart';

class AlbumDetailScreen extends ConsumerWidget {
  static const String name = 'album_detail_screen';

  final String albumId;
  Album? album;

  AlbumDetailScreen({super.key, required this.albumId, this.album});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(title: Text(album!.albumName),),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Image.network(album!.imgURL),
                const SizedBox(height: 30),
                Text('${album!.albumName} (${album!.year})', style: const TextStyle(fontSize: 24),),
                const SizedBox(height: 30),
                Text(album!.artist),
                const SizedBox(height: 30),
                Text(album!.description),
                const SizedBox(height: 30,),

                ElevatedButton(
                  onPressed: (){
                    context.push('/edit_album/${album!.albumId}');
                  }, 
                  child: const Text('Editar'),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}