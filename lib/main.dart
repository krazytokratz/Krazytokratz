import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/kraz_identity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  debugPrint(
     "Initializing ${KrazIdentity.name} v${KrazIdentity.version}"
  );
  runApp(const KrazApp());
}

class KrazApp extends StatelessWidget {
  const KrazApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kraz',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D1B2A),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterTts tts = FlutterTts();

  Future<void> bicara() async {
    await tts.setLanguage("id-ID");
    await tts.setSpeechRate(0.45);
    await tts.setPitch(1.0);

    await tts.speak(
      "Halo. Saya Kraz. Senang bertemu dengan Anda. Saya siap membantu.",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.smart_toy,
                  size: 100,
                  color: Colors.lightBlueAccent,
                ),
                const SizedBox(height: 25),
                const Text(
                  "KRAZ",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Personal AI Assistant",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Halo.\nSaya Kraz.\nSaya siap membantu Anda.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton.icon(
                  onPressed: bicara,
                  icon: const Icon(Icons.mic),
                  label: const Text("Mulai Berbicara"),
                ),
                const SizedBox(height: 60),
                const Text(
                  "Genesis v0.1",
                  style: TextStyle(
                    color: Colors.white38,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}