import 'package:cookie_clicker/theme/colors.dart';
import 'package:cookie_clicker/widget/chip_button.dart';
import 'package:cookie_clicker/widget/clicker.dart';
import 'package:cookie_clicker/widget/effect_card.dart';
import 'package:flutter/material.dart';

enum Category { bonus, skin }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int score = 1000;
  int cookiePerClick = 1;
  String skin = "cookie_1.png";
  Category categoryDisplayed = Category.bonus;

  /// Effects
  bool bonusOne = false;

  /// Skin
  bool skinOne = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Score",
                  style: TextStyle(color: kOrange, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "$score",
                  style: TextStyle(
                    color: kGrey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                Clicker(
                  cookiePerClick: cookiePerClick,
                  skin: skin,
                  onTap: () {
                    setState(() {
                      score += cookiePerClick;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ChipButton(
                      isSelected: categoryDisplayed == Category.bonus,
                      content: "Bonus",
                      onTap: () {
                        setState(() {
                          categoryDisplayed = Category.bonus;
                        });
                      },
                    ),
                    const SizedBox(width: 20),
                    ChipButton(
                      isSelected: categoryDisplayed == Category.skin,
                      content: "Skin",
                      onTap: () {
                        setState(() {
                          categoryDisplayed = Category.skin;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                categoryDisplayed == Category.bonus
                    ? EffectCard(
                        description: "Increase the number of cookies received by 3.",
                        name: "White Creamy",
                        isUnlocked: bonusOne,
                        onUnlocked: () {
                          setState(() {
                            bonusOne = true;
                            score -= 100;
                            cookiePerClick = 3;
                          });
                        },
                        price: 100,
                        skin: "cookie_2.png",
                        score: score,
                      )
                    : EffectCard(
                        description: "You will get bloods on your hands.",
                        name: "Red",
                        isUnlocked: skinOne,
                        onUnlocked: () {
                          setState(() {
                            skinOne = true;
                            skin = "cookie_4.png";
                          });
                        },
                        price: 100,
                        skin: "cookie_4.png",
                        score: score,
                      ),
              ],
            ),
          ),
        ));
  }
}
