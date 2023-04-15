import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/register.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});
  static const routeName = '/bmi';

  @override
  State<BMI> createState() => _BMIViewPageState();
}

void Warning({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Color.fromRGBO(46, 77, 66, 1),
    content: Row(children: [
      Expanded(child: Text(message)),
    ]),
    behavior: SnackBarBehavior.floating,
  ));
}

class _BMIViewPageState extends State<BMI> {
  final height = TextEditingController();
  final weight = TextEditingController();
  String bmiResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form BMI'),
        backgroundColor: const Color.fromRGBO(60, 98, 85, 1),
      ),
      backgroundColor: Color.fromRGBO(254, 252, 243, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    width: 250,
                    height: 170,
                    child: Image.asset('assets/bmi3.jpg')),
              ),
            ),
            const Text.rich(
              TextSpan(
                  text: 'BMI Calculator', // default text style
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      color: Color.fromRGBO(60, 98, 85, 1))),
            ),
            const Text.rich(
              TextSpan(
                  text: ' ', // default text style
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      color: Color.fromRGBO(60, 98, 85, 1))),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(60, 98, 85, 1)),
                      borderRadius: BorderRadius.circular(15.0)),
                  labelText: 'Height',
                  labelStyle: TextStyle(color: Color.fromRGBO(60, 98, 85, 1)),
                  hintText: 'Enter your height in cm',
                ),
                controller: height,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(60, 98, 85, 1)),
                        borderRadius: BorderRadius.circular(15.0)),
                    labelText: 'Weight',
                    labelStyle: TextStyle(color: Color.fromRGBO(60, 98, 85, 1)),
                    hintText: 'Enter your weight in kg'),
                controller: weight,
              ),
            ),
            Container(
              height: 50,
              width: 150,
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 98, 85, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/homepage');
                  if (height.text == "" || weight.text == "") {
                    Warning(
                      context: context,
                      message: "Data can't be empty",
                    );
                    return;
                  }

                  if (!isNumeric(height.text) || !isNumeric(weight.text)) {
                    Warning(
                      context: context,
                      message: "Data must be a number",
                    );
                    return;
                  }
                  final _height = int.parse(height.text) / 100;
                  final _weight = int.parse(weight.text);
                  final _bmi = _weight / (_height * _height);
                  print("Nilai BMI : $_bmi");
                  setState(() {
                    bmiResult = _bmi.toStringAsFixed(2);
                  });
                },
                child: const Text(
                  'Count',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Text(
              "Your BMI: $bmiResult",
              style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(60, 98, 85, 1),
                  fontWeight: FontWeight.bold),
            ),
            Text(" "),
            Text(
              bmiResult.isEmpty
                  ? '' // If bmiResult is empty, display an empty string
                  : double.parse(bmiResult) >= 30
                      ? "Category: Obesity" // If bmiResult is greater than or equal to 30, display "Category: Obesity"
                      : double.parse(bmiResult) >= 25 &&
                              double.parse(bmiResult) <= 29.9
                          ? "Category: Overweight" // If bmiResult is between 25 and 29.9, display "Category: Overweight"
                          : double.parse(bmiResult) >= 18.5 &&
                                  double.parse(bmiResult) < 25
                              ? "Category: Normal" // If bmiResult is between 18.5 and 24.9, display "Category: Normal"
                              : "Category: Underweight", // Otherwise, display "Category: Underweight"
              style: const TextStyle(
                  fontSize: 18, color: Color.fromRGBO(60, 98, 85, 1)),
            ),
          ],
        ),
      ),
    );
  }
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
