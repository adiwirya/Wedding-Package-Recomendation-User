import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/pakets.dart';
import 'providers/criterias.dart';
import 'providers/question.dart';
import 'providers/question_state.dart';
import 'screens/home_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_detail_screen.dart';
import 'screens/result_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Pakets(),
        ),
        ChangeNotifierProvider(
          create: (context) => Results(),
        ),
        ChangeNotifierProvider(
          create: (context) => Questions(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuestionState(),
        ),      
      ],
      child: MaterialApp(
        title: 'User App',
        home: const HomeScreen(),
        themeMode: ThemeMode.light,
        routes: {
          QuestionScreen.routeName: (ctx) => QuestionScreen(),
          ResultScreen.routeName: (ctx) => const ResultScreen(),
          ResultDetailScreen.routeName: (ctx) => const ResultDetailScreen(),
        },
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (ctx) => const HomeScreen(),
          );
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (ctx) => const HomeScreen(),
          );
        },
        debugShowCheckedModeBanner: false,
        
      ),
    );
  }
}
