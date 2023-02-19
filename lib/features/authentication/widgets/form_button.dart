import 'package:flutter/material.dart';
import '../../../constants/sizes.dart';

class Formbutton extends StatelessWidget {
  Formbutton({
    super.key,
    required this.disabled,
    this.btnText = "Next",
  });

  final bool disabled;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),
        duration: const Duration(milliseconds: 500),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          style: TextStyle(
            color: disabled ? Colors.grey.shade400 : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            btnText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
