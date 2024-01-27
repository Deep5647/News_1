import 'package:exam_1/Screen/Homepage.dart';
import 'package:exam_1/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screen/Fav.dart';
import 'Screen/Fav_1.dart';
import 'Screen/intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [

          ChangeNotifierProvider(
            create: (context) => ServiceData(),
          ),
        ],
        builder: (context, _) {
          return MaterialApp(
            theme: ThemeData.light(useMaterial3: true),

            debugShowCheckedModeBanner: false,
            initialRoute: 'spl',


            routes: {
              '/': (context) => const Homepage(),
              'spl': (context) => const spl(),
              'LikeScreen': (context) => const LikeScreen(),




            },
          );
        }
    );
  }
}
