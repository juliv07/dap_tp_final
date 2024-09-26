import 'package:go_router/go_router.dart';
import 'package:tp_final_dap/presentation/login_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: LoginScreen.name,
      path: '/login',
      builder: (  context, state) => const LoginScreen(),
    ),
  ]
);