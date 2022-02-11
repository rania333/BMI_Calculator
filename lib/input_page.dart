// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_app/customButton.dart';
import 'package:health_app/customCard.dart';
import 'package:health_app/customChild.dart';
import 'package:health_app/data.dart';
import 'package:health_app/resultPage.dart';

const activatedColor = Color.fromARGB(148, 24, 19, 26);
const activeColor = Color.fromARGB(14, 250, 93, 255);
const inActiveColor = Color.fromARGB(148, 24, 19, 26);

//tani column
int highet = 150;
int weight = 3;
int age = 1;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inActiveColor;
  Color femaleColor = inActiveColor;
  void updateColor(int gender) {
    setState(() {
      if (gender == 1) {
        if (maleColor == inActiveColor) {
          maleColor = activeColor;
          femaleColor = inActiveColor;
        } else {
          maleColor = inActiveColor;
        }
      }

      if (gender == 2) {
        if (femaleColor == inActiveColor) {
          femaleColor = activeColor;
          maleColor = inActiveColor;
        } else {
          femaleColor = inActiveColor;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator!'),
      ),
      body: Column(
        children: <Widget>[
          // ignore: avoid_unnecessary_containers
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    updateColor(1);
                  },
                  child: CustomCard(
                      color: maleColor,
                      cardChild: CustomChild(
                        icon: Icons.male,
                        label: 'MALE',
                      )),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    updateColor(2);
                  },
                  child: CustomCard(
                    color: femaleColor,
                    cardChild: CustomChild(
                      icon: Icons.female,
                      label: 'FEMALE',
                    ),
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: CustomCard(
            color: activatedColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT',
                    style: TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 239, 197, 247))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      highet.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 239, 197, 247)),
                    ),
                    Text('cm',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 239, 197, 247)))
                  ],
                ),
                Slider(
                  min: 20,
                  max: 200,
                  value: highet.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      highet = value.toInt();
                    });
                  },
                  activeColor: Colors.purple[700],
                  inactiveColor: Color.fromARGB(137, 238, 176, 252),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: CustomCard(
                  color: activatedColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 239, 197, 247)),
                      ),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 239, 197, 247)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                              onPressed: () {
                                setState(() {
                                  weight = weight - 1;
                                });
                              },
                              icon: Icon(Icons.remove)),
                          SizedBox(
                            width: 15,
                          ),
                          CustomButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: Icon(Icons.add))
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: CustomCard(
                  color: activatedColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 239, 197, 247)),
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 239, 197, 247)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: Icon(Icons.remove)),
                          SizedBox(
                            width: 15,
                          ),
                          CustomButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icon(Icons.add))
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              ResultData data = ResultData(height: highet, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            res: data.calculateBMI(),
                            status: data.getResult(),
                            comment: data.getInterpretation(),
                          )));
            },
            child: Container(
              padding: EdgeInsets.only(top: 15),
              child: const Text(
                'Calculate',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              color: Colors.purple[700],
              margin: EdgeInsets.only(top: 10),
              width: double.infinity, //full width
              height: 60,
            ),
          )
        ],
      ),
    );
  }
}
