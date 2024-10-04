import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_final_dap/entities/Album.dart';
import 'package:tp_final_dap/entities/User.dart';
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
  @override
  void initState() {
    super.initState();
    ref.read(albumProvider.notifier).getAllAlbums();
    
  }
  
  @override
  Widget build(BuildContext context) {
    //return Placeholder();
    User? userInfo = ref.watch(userInfoProvider);

    List<Album>? albums = ref.watch(albumProvider);

    if (userInfo == null || albums == null) {
      return const Center(child: CircularProgressIndicator());
    }
    
    return Scaffold(
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
                          return const Icon (Icons.broken_image);
                        },
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: (){
                        ref.read(currentAlbum.notifier).state = albums[index];
                        context.pushNamed(AlbumDetailScreen.name);
                      },
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}