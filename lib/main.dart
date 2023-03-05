import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tikntok/constants/sizes.dart';
import 'package:tikntok/features/authentication/widgets/sign_up_screen.dart';
import 'package:tikntok/features/main_navigation/main_navigation_screen.dart';
import 'package:tikntok/features/onbording/interests_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'TikTok Clone',
      home: MainNavigationScreen(),
    );
  }
}
