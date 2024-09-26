import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp_final_dap/entities/User.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

StateProvider<String> idProvider = StateProvider((ref) => '');

StateProvider<User> userInfoProvider = StateProvider((ref) => User(name: '', password: '', userId: ''));