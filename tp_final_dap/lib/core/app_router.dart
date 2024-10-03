import 'package:go_router/go_router.dart';
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
      builder: (  context, state) => LoginScreen(),
    ),
    GoRoute(
      name: HomeScreen.name,
      path: '/home',
      builder: (  context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/album_detail/:albumId',
      name: AlbumDetailScreen.name,
      builder: (context, state) => AlbumDetailScreen(
        albumId: state.pathParameters['albumId']!,
      ),
    ),
    GoRoute(
      path: '/edit_album/:albumId',
      name: EditAlbumScreen.name,
      builder: (context, state) => EditAlbumScreen(
        albumId: state.pathParameters['albumId']!,
      ),
    )
  ]
);