import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_final_dap/entities/Album.dart';
import 'package:tp_final_dap/entities/User.dart';
import 'package:tp_final_dap/presentation/add_album_screen.dart';
import 'package:tp_final_dap/presentation/album_detail_screen.dart';
import 'package:tp_final_dap/providers/albumProvider.dart';
import 'package:tp_final_dap/providers/userProvider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState()  {
    super.initState();
    
    _focusNode.addListener(() {
        if (_focusNode.hasFocus && ref.read(albumProvider).isEmpty) {
          ref.read(albumProvider.notifier).getAllAlbums();
        }
      }
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    //return Placeholder();
    User? userInfo = ref.watch(userInfoProvider);

    List<Album> albums = ref.watch(albumProvider);

    if (userInfo == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Focus(
      focusNode: _focusNode,
      autofocus: true,
      child: Scaffold(
        appBar: AppBar(title: Text('Albums de ${userInfo.name}')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: albums.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text(albums[index].albumName),
                        leading: Image.network(
                          albums[index].imgURL,
                          errorBuilder: (contex, error, stackTrace){
                            return const Icon (Icons.hide_image_outlined, size: 55, color: Colors.black45,);
                          },
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        minVerticalPadding: 18,
                        onTap: (){
                          ref.read(currentAlbum.notifier).state = albums[index];
                          ref.read(selectedAlbumIndexProvider.notifier).state = index;
                          context.pushNamed(AlbumDetailScreen.name);
                        },
                      );
                    }
                  ),
                ),
                FloatingActionButton(
                  onPressed: (){ 
                    context.pushNamed(AddAlbumScreen.name);
                    },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}