import 'package:cookie_clicker/theme/colors.dart';
import 'package:flutter/material.dart';

class EffectCard extends StatelessWidget {
  final String skin;
  final Function onUnlocked;
  final String name;
  final String description;
  final int price;
  final bool isUnlocked;
  final int score;
  const EffectCard({
    super.key,
    required this.skin,
    required this.onUnlocked,
    required this.name,
    required this.description,
    required this.price,
    required this.isUnlocked,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 160,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 160,
              height: 120,
              decoration: BoxDecoration(
                color: kSecondary,
                border: Border.all(
                  color: kGreyStroke,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    if (isUnlocked) {
                      return;
                    }

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            height: 200,
                            decoration: BoxDecoration(
                              color: kSecondary,
                              border: Border.all(
                                color: kGreyStroke,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: kGrey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  description,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: kGrey,
                                  ),
                                ),
                                const Spacer(),
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kOrange,
                                    ),
                                    onPressed: () {
                                      if (score > price) {
                                        Navigator.of(context).pop();
                                        onUnlocked();
                                      }
                                    },
                                    child: const Text(
                                      "Buy",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: kGrey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      isUnlocked
                          ? Text(
                              "Unlocked",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kOrange,
                                fontSize: 20,
                              ),
                            )
                          : Text(
                              "$price",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/$skin",
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
