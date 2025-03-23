import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:money_egg/startscreen.dart';
import 'package:money_egg/instructionscreen.dart';
import 'package:money_egg/eventscreen.dart';
import 'package:money_egg/actionscreen.dart';
import 'package:money_egg/shopscreen.dart';
import 'package:money_egg/minigame.dart';
import 'package:money_egg/nextscreen.dart';
import 'package:money_egg/paymentscreen.dart';
import 'package:money_egg/stagetransitionscreen.dart';
import 'package:money_egg/evolvedscreen.dart';
import 'package:money_egg/endscreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/start",
      routes: {
        "/start": (context) => const StartScreen(),
        "/htp": (context) => const InstructionScreen(),
        "/event": (context) => EventScreen(),
        "/actions": (context) => ActionScreen(),
        "/shop": (context) => ShopScreen(),
        "/work": (context) => MinigameScreen(),
        "/next": (context) => NextScreen(),
        "/payment": (context) => PaymentScreen(),
        "/stage1end": (context) => const StageTransitionScreen(),
        "/evolved": (context) => const EvolvedScreen(),
        "/end": (context) => const EndScreen(),
      },
    );
  }
}

// Stats
int day = 0; // Do + 1
int hp = 50;
int bal = 150;
int debt = 1000;
int paymentDueDate = 3;
int actionCount = 2;

// Financial Personality Type Calculation
int foodCount = 0;
int saveCount = 0;
int toyCount = 0;
int buyCount = 0;

// Ending Message
String endMessage = "Congratulations!\n\n With your excellent guidance, Egg developed financial awareness and learned how to manage its money to pay off its debt in time!\n\nCan you save even more money next time?";