import 'package:flutter/material.dart';
import 'package:rainbow/home/presentation/constants/app_colors.dart';
import 'package:rainbow/home/presentation/home_screen.dart';
import 'package:rainbow/injection/injection.dart';

void main() async {
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: "DM",
              bodyColor: AppColors.blackColor,
            ),
      ),
      home: const HomeScreen(),
    );
  }
}
