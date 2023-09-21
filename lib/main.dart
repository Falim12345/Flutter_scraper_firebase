import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:scraper_v1/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAMhhAVfMsddJUJO8yCkeao7S5twEy2_q8',
      appId: '1:1037175140904:web:f0e48b4e37871c378a3b1d',
      messagingSenderId: '1037175140904',
      projectId: 'flutter-scraper',
      authDomain: 'flutter-scraper.firebaseapp.com',
      storageBucket: 'flutter-scraper.appspot.com',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}
