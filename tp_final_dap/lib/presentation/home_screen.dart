import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp_final_dap/entities/User.dart';
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
  }
  
  @override
  Widget build(BuildContext context) {

    User userInfo = ref.watch(userInfoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Albums')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text('Bienvenido, ${userInfo.name}.')
            ],
          ),
        ),
      ),
    );
  }
}