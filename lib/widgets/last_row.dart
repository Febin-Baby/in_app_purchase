import 'package:flutter/material.dart';
import 'package:pim/core/color.dart';

class LastRowLetters extends StatelessWidget {
  final String first;
  final String second;
  final VoidCallback function;
  const LastRowLetters({
    Key? key,
    required this.first,
    required this.second,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(first),
        InkWell(
          onTap: () {
            function();
          },
          child: Text(
            second,
            style: const TextStyle(
              fontSize: 14,
              color: purpple,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
