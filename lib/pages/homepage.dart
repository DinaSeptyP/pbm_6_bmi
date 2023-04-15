import 'package:flutter/material.dart';

import 'bmi.dart';

Dialog confirmLogoutDialog(BuildContext context) => Dialog(
      child: Container(
        height: 150.0,
        width: 120.0,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  'Are you sure you want to log out?',
                  style: TextStyle(
                      color: Color.fromRGBO(60, 98, 85, 1), fontSize: 20.0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(
                          color: Color.fromRGBO(60, 98, 85, 1), fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text(
                        'Yeah, sure',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(60, 98, 85, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.data});

  static const routeName = '/homepage';

  final Map data;
  @override
  State<HomePage> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePage> {
  String? bmi;

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/app-icon.png';
    Map? _data;
    if (widget.data != null) {
      _data = widget.data;
      print(_data);
      print(_data['username']);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard BMI'),
          backgroundColor: const Color.fromRGBO(60, 98, 85, 1),
          actions: <Widget>[
            IconButton(
              onPressed: () async {
                final confirmed = await showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      confirmLogoutDialog(context),
                );
                if (confirmed == true) {
                  Navigator.pop(context);
                }
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(254, 252, 243, 1),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 0, top: 20),
                    child: Text("Hello, ${_data?['username']}",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                            color: Color.fromRGBO(60, 98, 85, 1))),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 25),
                    child: Text("Count your BMI",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                            color: Color.fromRGBO(60, 98, 85, 1))),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                          width: 270,
                          height: 160,
                          child: Image.asset('assets/bmi.jpg')),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Flexible(
                      child: Text(
                        "Body Mass Index (BMI) is a person\'s weight in kilograms (or pounds) divided by the square of height in meters (or feet). A high BMI can indicate high body fatness.",
                        style: TextStyle(
                            color: Color.fromRGBO(60, 98, 85, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: SizedBox(
                          width: 180,
                          height: 140,
                          child: Image.asset('assets/bmi2.jpg')),
                    ),
                    Flexible(
                      child: Text(
                        "BMI screens for weight categories that may lead to health problems, but it does not diagnose the body fatness or health of an individual.",
                        style: TextStyle(
                            color: Color.fromRGBO(60, 98, 85, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20, top: 15),
                    child: Container(
                        height: 50,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(60, 98, 85, 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/bmi");
                          },
                          child: const Text(
                            'Start',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
