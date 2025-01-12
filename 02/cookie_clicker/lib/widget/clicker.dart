import 'package:cookie_clicker/bloc/core_bloc.dart';
import 'package:cookie_clicker/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Clicker extends StatelessWidget {
  const Clicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreBloc, CoreState>(
      builder: (context, state) {
        CoreBloc core = context.read<CoreBloc>();
        return SizedBox(
          height: 250,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
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
                      context.read<CoreBloc>().add(OnCookieTapped());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tap for Cookies",
                            style: TextStyle(
                              fontSize: 18,
                              color: kOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: kGrey, fontSize: 14),
                              children: [
                                const TextSpan(
                                  text: 'Get ',
                                ),
                                TextSpan(
                                    text: '${core.cookiePerClick}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                const TextSpan(
                                  text: ' cookies per click and watch\nyour points soar !',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    "assets/${core.currentSkin}",
                    width: 150,
                    height: 150,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
