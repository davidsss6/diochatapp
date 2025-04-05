import 'package:chatdioapp/pages/splash_screen_page.dart';
import 'package:chatdioapp/service/dark_mode_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider<DarkModeService>(
              create: (_) => DarkModeService()),
        ],
      child: Consumer<DarkModeService>(
          builder: (_, darkModeService, widget) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Chat DIO',
                theme: darkModeService.isDarkMode
                    ? ThemeData.dark()
                    : ThemeData.light(),
                home: const SplashScreen());
          },
        ));
  }
}