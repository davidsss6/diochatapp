import 'package:chatdioapp/my_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  FirebaseOptions options = await DefaultFirebaseOptions.currentPlatform;
  await Firebase.initializeApp(options: options);
  runApp(const MyApp());
}
