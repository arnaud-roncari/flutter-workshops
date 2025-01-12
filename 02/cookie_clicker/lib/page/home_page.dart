import 'package:cookie_clicker/bloc/core_bloc.dart';
import 'package:cookie_clicker/theme/colors.dart';
import 'package:cookie_clicker/widget/chip_button.dart';
import 'package:cookie_clicker/widget/clicker.dart';
import 'package:cookie_clicker/widget/effect_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Category { bonus, skin }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// UI still have their own states.
  Category categoryDisplayed = Category.bonus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        body: BlocBuilder<CoreBloc, CoreState>(
          builder: (context, state) {
            /// Note: Properties can be accessed through states or directly by accessing the BLoC.
            /// In complex scenarios, you might want to access properties depending on the data received.
            /// But in this scenario, we will keep it simple.
            CoreBloc core = context.read<CoreBloc>();

            return SafeArea(
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
                      core.score.toString(),
                      style: TextStyle(
                        color: kGrey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Clicker(),
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

                    /// Note: In complex scenarios, you would make an HTTP request at the initialization of the BLoC to receive the data.
                    /// The data would be bound into models, which are classes used to map raw JSON from the HTTP request to properly typed properties.
                    /// This makes it easier for uses in the app.
                    /// These models would then be used to create the effect cards.
                    /// This reduces the hardcoded parts of the code.
                    /// But today, we will keep it simple.

                    categoryDisplayed == Category.bonus
                        ? EffectCard(
                            description: "Increase the number of cookies received by 3.",
                            name: "White Creamy",
                            isUnlocked: core.bonusOne,
                            onUnlocked: () {
                              context.read<CoreBloc>().add(OnBonusOneUnlocked());
                            },
                            price: 100,
                            skin: "cookie_2.png",
                            score: core.score,
                          )
                        : EffectCard(
                            description: "You will get bloods on your hands.",
                            name: "Red",
                            isUnlocked: core.skinOne,
                            onUnlocked: () {
                              context.read<CoreBloc>().add(OnSkinOneUnlocked());
                            },
                            price: 100,
                            skin: "cookie_4.png",
                            score: core.score,
                          ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
