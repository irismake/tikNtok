import 'package:flutter/material.dart';
import 'package:tikntok/constants/gaps.dart';
import 'package:tikntok/constants/sizes.dart';
import 'package:tikntok/features/authentication/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onSignUpTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: ((context) => const SignUpScreen()),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(
          children: const [
            Gaps.v80,
            Text(
              "Log in to TikTok",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v20,
            Text(
              "Create a profile, follow other accounts, make your own videos, and more.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black45,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )),
      bottomNavigationBar: BottomAppBar(
          color: Colors.grey.shade100,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Don't have an account?",
              ),
              Gaps.h5,
              GestureDetector(
                onTap: (() => onSignUpTap(context)),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}