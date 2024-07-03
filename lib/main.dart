import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_crud/pages/agregar_usuario.dart';
import 'package:flutter_crud/pages/home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "taller",
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "agregar": (context) => const AgregarUsuario()
      },
    );
  }
}
