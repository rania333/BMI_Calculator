import 'package:flutter/material.dart';
import 'package:health_app/customCard.dart';

const activatedColor = Color.fromARGB(148, 24, 19, 26);

class ResultPage extends StatefulWidget {
  ResultPage({required this.status, required this.res, required this.comment});
  final String status;
  final String res;
  final String comment;
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator!'),
        foregroundColor: Colors.purple[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Your Result',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              )),
          Expanded(
            flex: 5,
            child: CustomCard(
              color: activatedColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.status.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.purpleAccent),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.res,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      widget.comment,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              // ignore: unnecessary_const
              padding: const EdgeInsets.only(top: 15),
              child: const Text(
                'Re-calculate',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              color: Colors.purple[700],
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity, //full width
              height: 60,
            ),
          )
        ],
      ),
    );
  }
}
