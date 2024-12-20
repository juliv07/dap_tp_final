import 'package:go_router/go_router.dart';
import 'package:tp_final_dap/presentation/add_album_screen.dart';
import 'package:tp_final_dap/presentation/album_detail_screen.dart';
import 'package:tp_final_dap/presentation/edit_album_screen.dart';
import 'package:tp_final_dap/presentation/home_screen.dart';
import 'package:tp_final_dap/presentation/login_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: LoginScreen.name,
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      name: HomeScreen.name,
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/album_detail',
      name: AlbumDetailScreen.name,
      builder: (context, state) => AlbumDetailScreen(),
    ),
    GoRoute(
      path: '/edit_album',
      name: EditAlbumScreen.name,
      builder: (context, state) => EditAlbumScreen(),
    ),
    GoRoute(
      path: '/add_album',
      name: AddAlbumScreen.name,
      builder: (context, state) => AddAlbumScreen(),
    ),
  ]
);