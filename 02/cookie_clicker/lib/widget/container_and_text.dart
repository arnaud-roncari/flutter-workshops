import 'package:flutter/material.dart';

class ContainerAndText extends StatelessWidget {
  const ContainerAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 200,
      width: 200,
      child: const Center(
        child: Text(
          "Hello world !",
        ),
      ),
    );
  }
}
