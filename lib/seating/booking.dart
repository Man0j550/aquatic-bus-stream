import 'package:flutter/material.dart';
import 'busseats.dart';
import 'busseats2.dart';
import 'designs.dart';

// ignore: must_be_immutable
class busbook extends StatefulWidget {
  int a = 0;
  late String b;

  busbook(int c, String d, {Key? key}) : super(key: key) {
    a = c;
    b = d;
  }

  @override
  _busbookState createState() => _busbookState(a, b);
}

class _busbookState extends State<busbook> {
  int a = 0;
  late String b;

  _busbookState(int c, String d) {
    a = c;
    b = d;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your Seat', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey[900], // Set app bar background color
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 7,
            ),
            Text('Choose seats based on fares',
                style: design.texst(18, FontWeight.w700)),
            Container(
              height: 7,
            ),
            (a == 1)
                ? Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Busseats())
                : Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Busseats2()),
            Container(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}
