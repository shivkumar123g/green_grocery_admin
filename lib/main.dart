import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/view_models/auth_view_model/auth_view_model_provider.dart';
import 'ui/home/home_page.dart';
import 'ui/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = context.read(authViewModelProvider).user;
    return MaterialApp(
      title: 'Green Grocery Admin',
      debugShowCheckedModeBanner: false,
      home: user != null ? HomePage() : LoginPage(),
    );
  }
}
