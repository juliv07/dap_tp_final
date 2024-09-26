import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPasswordVisibilityNotifier extends StateNotifier<bool> {
  LoginPasswordVisibilityNotifier() : super(true);

  void toggle() {
    state = !state;
  }
}

final loginPasswordVisibilityProvider = StateNotifierProvider<LoginPasswordVisibilityNotifier, bool>((ref) {
  return LoginPasswordVisibilityNotifier();
});


class LoginScreen extends ConsumerWidget {
  static const String name = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    TextEditingController nameController = TextEditingController();
    TextEditingController pswdController = TextEditingController();

    FirebaseFirestore db = FirebaseFirestore.instance;

    final focusNode1 = FocusNode();
    final focusNode2 = FocusNode();
    final focusNode3 = FocusNode();

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey, 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bienvenido',textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 34,
                  ),
                ),
                        
                const SizedBox(height: 30.0),
                        
                TextFormField(
                  focusNode: focusNode1,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(focusNode2);
                  },
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Nombre de usuario',
                    icon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 50, 143, 255),
                      )
                    ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } 
                      return null; // Devuelve null si no hay error
                    },
                ),

                const SizedBox(height: 30.0),
                        
                TextFormField(
                  focusNode: focusNode2,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(focusNode3);
                  },
                  obscureText: ref.watch(loginPasswordVisibilityProvider),
                  controller: pswdController,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                      icon: const Icon(
                        Icons.password,
                        color: Color.fromARGB(255, 50, 143, 255),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          ref.watch(loginPasswordVisibilityProvider)
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          ref.read(loginPasswordVisibilityProvider.notifier).toggle();
                        },
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo no puede estar vacío';
                      } 
                      return null; // Devuelve null si no hay error
                    },
                  ),

                  ElevatedButton(
                    focusNode: focusNode3,
                    onPressed: () async {
                  
                      if (_formKey.currentState?.validate() ?? false) {
                        String inputName = nameController.text;
                        String inputPassword = pswdController.text;

                        final firebaseData = await db
                        .collection('users')
                        .where('name', isEqualTo: inputName)
                        .where('password', isEqualTo: inputPassword)
                        .get();
                      }
                    },
                    child: const Text('Ingresar'),
                  ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}