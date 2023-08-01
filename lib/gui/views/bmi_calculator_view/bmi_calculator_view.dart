import 'package:calculadora_peso_flutter/gui/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:calculadora_peso_flutter/gui/styles.dart';

class BMICalculatorView extends StatelessWidget {
  const BMICalculatorView({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: const [
          TextWidget(text: "Calculadora de peso ideal", fontSize: 30.0,),
        ],
      ),
    );
  }
}