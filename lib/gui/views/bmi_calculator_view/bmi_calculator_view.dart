import 'package:flutter/material.dart';

import 'package:calculadora_peso_flutter/gui/widgets/primary_button.dart';
import 'package:calculadora_peso_flutter/gui/widgets/text_widget.dart';
import 'package:calculadora_peso_flutter/gui/styles.dart';

class BMICalculatorView extends StatelessWidget {
  const BMICalculatorView({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const TextWidget(text: "Calculadora de peso ideal", fontSize: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _cardItems(
                  item: Column(
                    children: const [
                      TextWidget(text: "Masculino")
                    ],
                  ),
                  width: (media.width - 40) / 2 - 5
                  // width: 50.0
                ),
                _cardItems(
                  item: Column(
                    children: const [
                      TextWidget(text: "Femenino")
                    ],
                  ),
                  width: (media.width - 40) / 2 - 5
                ),
              ],
            ),
            _cardItems(
              item: Column(
                children: const [
                  TextWidget(text: "Altura"),
                  TextWidget(text: "170 cm")
                ],
              )
            ),
            SizedBox(
              width: media.width * .8,
              child: PrimaryButton(text: "Calcular", onPressed: () {},),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardItems({ required Widget item, double? width }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: width ?? double.infinity,
      // width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: item,
    );
  }

}