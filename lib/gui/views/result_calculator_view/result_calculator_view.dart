import 'package:flutter/material.dart';
import 'dart:math';

import 'package:calculadora_peso_flutter/gui/styles.dart';
import 'package:calculadora_peso_flutter/gui/widgets/primary_button.dart';
import 'package:calculadora_peso_flutter/gui/widgets/text_widget.dart';

class ResultCalculatorView extends StatelessWidget {
  const ResultCalculatorView({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    int peso = 83;
    int altura = 169;
    String resultText = '';

    double bmi = peso / pow(altura / 100, 2);
    String bmiString = bmi.toStringAsFixed(1);
    double bmiFormatted = double.parse(bmiString);

    if (bmiFormatted < 18.5) {
      // Bajo de peso
      resultText = 'Bajo de peso';
    } else if (bmiFormatted > 18.5 && bmiFormatted < 24.9) {
      // Peso normal
      resultText = 'Peso normal';
    } else if (bmiFormatted > 25.0 && bmiFormatted < 29.9) {
      // Exceso de peso
      resultText = 'Exceso de peso';
    } else if (bmiFormatted > 30.0 && bmiFormatted < 34.9) {
      // Obesity Class I (moderate)
      resultText = 'Obesidad clase 1 (Moderada)';
    } else if (bmiFormatted > 35.0 && bmiFormatted < 39.9) {
      // Obesity Class II (severe)
      resultText = 'Obesidad clase 2 (Severa)';
    } else if (bmiFormatted > 40.0 && bmiFormatted < 49.0 ) {
      // Obesity Class III (morbid)
      resultText = 'Obesidad clase 3 (Mórbida)';
    } else if (bmiFormatted > 50.0) {
      // Obesity Class V (super-obesity)
      resultText = 'Obesidad clase 5 (Super obeso)';
    }
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextWidget(text: 'RESULTADO'),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    TextWidget(text: resultText, fontSize: 30.0),
                    const SizedBox(height: 15.0),
                    const Divider(),
                    const SizedBox(height: 15.0),
                    TextWidget(text: '$bmiFormatted', fontSize: 50.0),
                    const SizedBox(height: 15.0),
                    const Divider(),
                    const SizedBox(height: 15.0),
                    const TextWidget(text: 'Adding a Drawer to your app helps you navigate inside your app. In this tutorial, we learned how to change drawer icon in Flutter with practical examples. We also explored how to change the color and size of the drawer icon step by step.')
                  ],
                ),
              ),
            ),
            PrimaryButton(text: 'Volver a calcular', onPressed: () {})
          ],
        ),
      ),
    );
  }
}