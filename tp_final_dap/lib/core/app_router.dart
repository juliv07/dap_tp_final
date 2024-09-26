import 'package:go_router/go_router.dart';
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
  ]
);