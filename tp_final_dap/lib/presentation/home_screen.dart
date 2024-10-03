import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_final_dap/entities/Album.dart';
import 'package:tp_final_dap/entities/User.dart';
import 'package:tp_final_dap/providers/albumProvider.dart';
import 'package:tp_final_dap/providers/userProvider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  static const String name = 'home';

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

    User userInfo = ref.watch(userInfoProvider);
    List<Album> albums = ref.watch(albumProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Albums de ${userInfo.name}')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ListView.builder(
                itemCount: albums.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(albums[index].albumName),
                    leading: Image.network(albums[index].imgURL),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: (){
                      context.push('/album_detail/${albums[index].albumId}');
                    },
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}