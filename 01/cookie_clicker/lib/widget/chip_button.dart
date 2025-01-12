import 'package:cookie_clicker/theme/colors.dart';

import 'package:flutter/material.dart';

class ChipButton extends StatelessWidget {
  final String content;
  final bool isSelected;
  final Function onTap;
  const ChipButton({super.key, required this.isSelected, required this.content, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 105,
      decoration: BoxDecoration(
        color: isSelected ? kOrange : kSecondary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            onTap();
          },
          child: Center(
            child: Text(
              content,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : kGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
