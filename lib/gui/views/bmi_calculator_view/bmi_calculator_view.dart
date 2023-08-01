import 'package:flutter/material.dart';

import 'package:calculadora_peso_flutter/gui/widgets/primary_button.dart';
import 'package:calculadora_peso_flutter/gui/widgets/text_widget.dart';
import 'package:calculadora_peso_flutter/gui/styles.dart';

class BMICalculatorView extends StatefulWidget {
  const BMICalculatorView({ Key? key }) : super( key: key );

  @override
  State<BMICalculatorView> createState() => _BMICalculatorViewState();
}

class _BMICalculatorViewState extends State<BMICalculatorView> {
  double valueSlider = 150.0;

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextWidget(text: "Calculadora de peso ideal", fontSize: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _cardItems(
                  item: Column(
                    children: const [
                      Icon(
                        Icons.male,
                        color: Colors.white,
                        size: 60.0,
                      ),
                      TextWidget(text: "Masculino")
                    ],
                  ),
                  width: (media.width - 40) / 2 - 5
                  // width: 50.0
                ),
                _cardItems(
                  item: Column(
                    children: const [
                      Icon(
                        Icons.female,
                        color: Colors.white,
                        size: 60.0,
                      ),
                      TextWidget(text: "Femenino"),
                    ],
                  ),
                  width: (media.width - 40) / 2 - 5
                ),
              ],
            ),
            _cardItems(
              item: Column(
                children: [
                  const TextWidget(text: "Altura"),
                  TextWidget(text: "${valueSlider.toInt()} cm"),
                  Slider(
                    value: valueSlider,
                    min: 50,
                    max: 250,
                    onChanged: (double value) {
                      setState(() {
                        valueSlider = value;
                      });
                    },
                  )
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _cardItems(
                  item: Column(
                    children: [
                      const TextWidget(text: "Peso"),
                      RichText(
                        text: const TextSpan(
                          text: '50',
                          style: TextStyle( fontSize: 25.0, fontWeight: FontWeight.bold ),
                          children: [
                            TextSpan(
                              text: ' Kg',
                              style: TextStyle( fontSize: 15.0 )
                            )
                          ]
                        )
                      ),
                    ],
                  ),
                  width: (media.width - 40) / 2 - 5
                  // width: 50.0
                ),
                _cardItems(
                  item: Column(
                    children: [
                      const TextWidget(text: "Edad"),
                      RichText(
                        text: const TextSpan(
                          text: '20',
                          style: TextStyle( fontSize: 25.0, fontWeight: FontWeight.bold ),
                          children: [
                            TextSpan(
                              text: ' Años',
                              style: TextStyle( fontSize: 15.0 )
                            )
                          ]
                        )
                      ),
                    ],
                  ),
                  width: (media.width - 40) / 2 - 5
                ),
              ],
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
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: item,
    );
  }
}