import 'package:firebase_core/firebase_core.dart';
// dart pub global activate flutterfire_cli
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'services/auth/auth_gate.dart';
import 'services/database/database_provider.dart';
import 'themes/theme_provider.dart';

void main() async {
  // firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // run app
  runApp(
    MultiProvider(
      providers: [
        // theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),

        // database provider
        ChangeNotifierProvider(create: (context) => DatabaseProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => const AuthGate()},
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
