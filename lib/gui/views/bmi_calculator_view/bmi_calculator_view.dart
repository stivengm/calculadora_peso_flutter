import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

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
  int gender = 0;
  int age = 20;
  int weight = 50;

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
            const SizedBox(),
            const TextWidget(text: "Calculadora de peso ideal", fontSize: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (gender == 1) {
                        gender = 0;
                      } else {
                        gender = 1;
                      }
                    });
                  },
                  child: _cardItems(
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
                    colorItem: gender == 1 ? selectedColor :  cardColor,
                    width: (media.width - 40) / 2 - 5
                    // width: 50.0
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (gender == 2) {
                        gender = 0;
                      } else {
                        gender = 2;
                      }
                    });
                  },
                  child: _cardItems(
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
                    colorItem: gender == 2 ? selectedColor :  cardColor,
                    width: (media.width - 40) / 2 - 5
                  ),
                ),
              ],
            ),
            _cardItems(
              item: Column(
                children: [
                  const TextWidget(text: "Altura"),
                  RichText(
                    text: TextSpan(
                      text: '${valueSlider.toInt()}',
                      style: const TextStyle( fontSize: 25.0, fontWeight: FontWeight.bold ),
                      children: const [
                        TextSpan(
                          text: ' cm',
                          style: TextStyle( fontSize: 15.0 )
                        )
                      ]
                    )
                  ),
                  Slider(
                    thumbColor: secundaryButton,
                    activeColor: selectedColor.withOpacity(.3),
                    inactiveColor: selectedColor.withOpacity(.3),
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
                        text: TextSpan(
                          text: weight.toString(),
                          style: const TextStyle( fontSize: 25.0, fontWeight: FontWeight.bold ),
                          children: const [
                            TextSpan(
                              text: ' Kg',
                              style: TextStyle( fontSize: 15.0 )
                            )
                          ]
                        )
                      ),
                      const SizedBox( height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buttonRemove(
                            () {
                              setState(() {
                                if (weight >= 2) {
                                  weight = weight - 1;
                                }
                              });
                            }
                          ),
                          const SizedBox( width: 10.0 ),
                          _buttonsAdd(
                            () {
                             setState(() {
                                if (weight <= 249) {
                                  weight = weight + 1;
                                }
                              }); 
                            }
                          ),
                        ],
                      )
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
                        text: TextSpan(
                          text: age.toString(),
                          style: const TextStyle( fontSize: 25.0, fontWeight: FontWeight.bold ),
                          children: [
                            TextSpan(
                              text: age == 1 ? ' Año' : ' Años',
                              style: const TextStyle( fontSize: 15.0 )
                            )
                          ]
                        )
                      ),
                      const SizedBox( height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buttonRemove(
                            () {
                              setState(() {
                                if (age >= 2) {
                                  age = age - 1;
                                }
                              });
                            }
                          ),
                          const SizedBox( width: 10.0 ),
                          _buttonsAdd(
                            () {
                             setState(() {
                                if (age <= 99) {
                                  age = age + 1;
                                }
                              }); 
                            }
                          ),
                        ],
                      )
                    ],
                  ),
                  width: (media.width - 40) / 2 - 5
                ),
              ],
            ),
            SizedBox(
              width: media.width * .8,
              child: PrimaryButton(text: "Calcular", onPressed: next,),
            ),
          ],
        ),
      ),
    );
  }

  next() {
    if (gender == 0) {
      Fluttertoast.showToast(
        msg: "Por favor selecciona el género",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
      return;
    }

    Navigator.pushNamed(context, 'result');
  }

  Widget _cardItems({ required Widget item, double? width, Color? colorItem }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: colorItem ?? cardColor,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: item,
    );
  }

  Widget _buttonsAdd(VoidCallback action) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: selectedColor,
        child: InkWell(
          onTap: action,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonRemove(VoidCallback action) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: selectedColor,
        child: InkWell(
          onTap: action,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

}