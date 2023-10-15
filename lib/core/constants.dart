import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Boldtext extends StatelessWidget {
  const Boldtext({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Lora',
      ),
    );
  }
}

class Boldtext18 extends StatelessWidget {
  const Boldtext18({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        fontFamily: 'Lora',
      ),
    );
  }
}

late double khieght;
late double kwidth;

selectHieght(double? height) {
  return SizedBox(
    height: height,
  );
}

FirebaseAuth auth = FirebaseAuth.instance;
