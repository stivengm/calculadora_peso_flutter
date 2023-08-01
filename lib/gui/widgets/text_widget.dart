import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  const TextWidget({ Key? key, required this.text, this.fontSize = 18.0 }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
        color: Colors.white,
        fontSize: fontSize
      ),
    );
  }
}