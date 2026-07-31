import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'screens/home_screen.dart';
import 'core/kraz_identity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  debugPrint(
    "Initializing "
    "${KrazIdentity.fullName} "
    "(${KrazIdentity.name}) "
    "v${KrazIdentity.version}",
  );

  runApp(const KrazApp());
}

class KrazApp extends StatelessWidget {
  const KrazApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: KrazIdentity.name,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D1B2A),
        colorSchemeSeed: Colors.lightBlueAccent,
      ),
      home: const HomeScreen(),
    );
  }
}