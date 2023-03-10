import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tikntok/constants/gaps.dart';
import 'package:tikntok/constants/sizes.dart';
import 'package:tikntok/features/authentication/widgets/auth_button.dart';
import 'package:tikntok/features/authentication/widgets/login_screen.dart';
import 'package:tikntok/features/authentication/widgets/username_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _onEmailSignTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
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
          children: [
            Gaps.v80,
            Text(
              "Sign up for TikTok",
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
            Gaps.v40,
            AuthButton(
              icon: FaIcon(FontAwesomeIcons.user),
              text: "Use email & password",
              nextTap: _onEmailSignTap,
            ),
            Gaps.v16,
            AuthButton(
              text: "Continue with Apple",
              icon: FaIcon(FontAwesomeIcons.apple),
              nextTap: _onEmailSignTap,
            ),
          ],
        ),
      )),
      bottomNavigationBar: BottomAppBar(
          color: Colors.grey.shade50,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Already have an account?",
              ),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onLoginTap(context),
                child: Text(
                  "Log in",
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
