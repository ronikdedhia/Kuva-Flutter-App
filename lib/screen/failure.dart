import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kuva/screen/Category_affirmation_screen.dart';

class Failure extends StatelessWidget {
  final int code;
  final String message;
  Failure(this.code, this.message);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Payment Failure',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Payment Failure'),
          ),
          body: SafeArea(
            child: Scaffold(
              body: Column(
                children: <Widget>[
                  SizedBox(height: 70),
                  Center(
                    child: Image.asset(
                      'assets/failure.png',
                      width: size.width * .30,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text("Payment Failed!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w800)),
                    ),
                  ),
                  Center(
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.all(7.0),
                            padding: const EdgeInsets.all(30.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xffFFAC38), width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: SelectableText(
                              message,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topCenter,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.red),
                              child: Text('Sorry!'),
                            )),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(85, 20, 85, 20),
                      child: Text(
                          "Payment failed to Sattvarise Co. on " +
                              DateFormat.yMMMd().format(DateTime.now()) +
                              " at " +
                              DateFormat('HH:mm').format(DateTime.now()) +
                              "\nPayment Failure Code is " +
                              code.toString() +
                              "\nPlease Try Again!",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                    child: SizedBox(
                      width: double.infinity,
                      child: blueButton(
                        "Copy Failure Code",
                        () {
                          Clipboard.setData(
                              new ClipboardData(text: (code.toString())));
                          Flushbar(
                            title: "Ok",
                            message: "Token copied successfully",
                            duration: Duration(seconds: 3),
                          )..show(context);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                      child: SizedBox(
                          width: double.infinity,
                          child: blueButton("Go Home",
                              () => {Navigator.pushNamed(context, '/')}))),
                ],
              ),
            ),
          )),
    );
  }
}

MaterialButton viewMoreButtons(String title, Function fun) {
  return MaterialButton(
    onPressed: fun,
    textColor: Colors.white,
    color: const Color(0xffFFAC38),
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.left,
      ),
    ),
    height: 55,
    minWidth: 700,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
  );
}

RaisedButton blueButton(String label, Function fun) {
  return RaisedButton(
    onPressed: fun,
    textColor: Colors.white,
    color: Color(0xfff063057),
    padding: const EdgeInsets.all(15.0),
    child: Text(label),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}

Widget listItemContainer(String title, String value) => Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(196, 196, 196, 1)),
          ),
          SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
        ],
      ),
      decoration: BoxDecoration(
          border: new Border(
              bottom: new BorderSide(width: 1.0, color: Color(0xffC4C4C4)))),
    );
