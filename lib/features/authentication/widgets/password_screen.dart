import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tikntok/constants/gaps.dart';
import 'package:tikntok/features/authentication/widgets/birthday_screen.dart';
import 'package:tikntok/features/authentication/widgets/form_button.dart';
import 'package:tikntok/features/authentication/widgets/password_screen.dart';

import '../../../constants/sizes.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordScroller = TextEditingController();
  String _password = "";

  bool _obscureText = true;

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  void _onClearTap() {
    _passwordScroller.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _passwordScroller.addListener(() {
      setState(() {
        _password = _passwordScroller.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordScroller.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Sign up',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Gaps.v40,
            Text(
              "Password",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v20,
            TextField(
              controller: _passwordScroller,
              onEditingComplete: _onSubmit,
              obscureText: _obscureText,
              autocorrect: false,
              decoration: InputDecoration(
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: _onClearTap,
                      child: FaIcon(
                        FontAwesomeIcons.solidCircleXmark,
                        color: Colors.grey.shade500,
                        size: Sizes.size20,
                      ),
                    ),
                    Gaps.h16,
                    GestureDetector(
                      onTap: _toggleObscureText,
                      child: FaIcon(
                        _obscureText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        color: Colors.grey.shade500,
                        size: Sizes.size20,
                      ),
                    ),
                  ],
                ),
                hintText: "Make it strong",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v10,
            const Text(
              "Your password must have:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.circleCheck,
                  size: Sizes.size20,
                  color:
                      _isPasswordValid() ? Colors.green : Colors.grey.shade400,
                ),
                Gaps.h5,
                Text("8 to 20 characters"),
              ],
            ),
            Gaps.v32,
            GestureDetector(
              onTap: _onSubmit,
              child: Formbutton(disabled: !_isPasswordValid()),
            ),
          ]),
        ),
      ),
    );
  }
}
