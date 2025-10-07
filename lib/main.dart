import 'package:flutter/material.dart';

import 'screens/main/home.dart';
import 'screens/main/detail.dart';
import 'screens/main/buat.dart';
import 'screens/main/edit.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'providers/profil_provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProfilProvider(),
      builder: (context, child) {
        return App();
      },
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/home": (_) => Home(),
        "/detail": (_) => Detail(),
        "/buat": (_) => Buat(),
        "/edit": (_) => Edit(),
      },
      initialRoute: "/home",
    );
  }
}
