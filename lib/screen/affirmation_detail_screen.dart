import 'success.dart';
import 'failure.dart';
import 'package:flutter/material.dart';
import 'package:kuva/screen/FirstScreen.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:kuva/screen/tabs_screen.dart';
import 'package:kuva/widgets/category_item.dart';
import '../dummy_data.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:slider_button/slider_button.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'Category_affirmation_screen.dart';

class AffirmationDetailScreen extends StatefulWidget {
  var count = 1;
  static var holder_3 = [];
  static var ttlist = [];
  static var imglist = [];
  static List<String> audiolist = [];
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;
  static var flag = 1;
  static var roncount = 1;
  var hl;
  AffirmationDetailScreen(this.toggleFavorite, this.isFavorite);

  @override
  _AffirmationDetailScreenState createState() =>
      _AffirmationDetailScreenState();
}

class _AffirmationDetailScreenState extends State<AffirmationDetailScreen>
    with SingleTickerProviderStateMixin {
  Map<String, bool> map2 = {};
  var count = 1;
  double _scale;
  AnimationController _controller;

  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
    _razorpay.clear();
  }

  implicit() {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedAff =
        DUMMY_Affirmations.firstWhere((meal) => meal.id == mealId);
    selectedAff.affirmations
        .forEach((selectedAff) => map2[selectedAff] = false);
    count = count + 1;
  }

  var holder_1 = [''];
  var holder_2 = [''];
  var tt_2 = [''];
  var img2 = [''];
  var audio2 = [''];
  getItems(String title, String imgurl, List audios) {
    map2.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print("Holder1::");
    print(holder_1);
    //AffirmationDetailScreen.holder_3.clear();
    //AffirmationDetailScreen.holder_3=[''];
    AffirmationDetailScreen.holder_3.addAll(holder_1);
    widget.hl = holder_1.length - 1;
    print('Holder1 length');
    print(widget.hl);
    // Here you will get all your selected Checkbox items.
    holder_1.clear();

    // Clear array after use.
    for (var i = 0; i < widget.hl; i++) {
      tt_2.insert(i, title);
    }
    print("tt2 is ");
    print(tt_2);
    AffirmationDetailScreen.ttlist.addAll(tt_2);
    print('Title list here is');
    print(AffirmationDetailScreen.ttlist);

    for (var i = 0; i < widget.hl; i++) {
      img2.insert(i, imgurl);
    }
    print("img2 is ");
    print(img2);
    AffirmationDetailScreen.imglist.addAll(img2);
    print('Title list here is');
    print(AffirmationDetailScreen.imglist);
  }

  Razorpay _razorpay;
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 350,
      width: 350,
      child: child,
    );
  }

  onPlayAudio(String name) async {
    setState(() {
      AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
      assetsAudioPlayer.open(Audio(name));
    });
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedAff =
        DUMMY_Affirmations.firstWhere((meal) => meal.id == mealId);
    var count2 = 1;
    if (count == 1) {
      print(count);
      implicit();
    }

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${selectedAff.title}'),
        ),
        body: SingleChildScrollView(
          child: Material(
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    selectedAff.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTapDown: _tapDown,
                  onTapUp: _tapUp,
                  child: Transform.scale(
                    scale: _scale,
                    child: _animatedButton(),
                  ),
                  onTap: () {
                    getItems(selectedAff.title, selectedAff.imageUrl,
                        selectedAff.audioName);
                    print('Title list');
                    print(AffirmationDetailScreen.ttlist);
                    print('Holder1:');
                    print(holder_1);
                    print('holder3:');

                    AffirmationDetailScreen.holder_3
                        .removeWhere((value) => value == "");
                    for (var i = 0; i < selectedAff.affirmations.length; i++) {
                      for (var j = 0;
                          j < AffirmationDetailScreen.holder_3.length;
                          j++) {
                        if (selectedAff.affirmations[i] ==
                            AffirmationDetailScreen.holder_3[j]) {
                          print("Checking for correct");
                          print(selectedAff.affirmations[i]);
                          audio2.add(selectedAff.audioName[i]);
                          AffirmationDetailScreen.audiolist.addAll(audio2);
                          audio2.clear();
                        }
                      }
                    }

                    print(AffirmationDetailScreen.holder_3);
                    AffirmationDetailScreen.ttlist
                        .removeWhere((value) => value == "");
                    AffirmationDetailScreen.audiolist
                        .removeWhere((value) => value == "");
                    print("Here comes the entire audio list printed");
                    print(AffirmationDetailScreen.audiolist);
                    print(AffirmationDetailScreen.ttlist);
                    AffirmationDetailScreen.imglist
                        .removeWhere((value) => value == "");
                    print(AffirmationDetailScreen.imglist);

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => FirstScreen(selectedAff.imageUrl,selectedAff.title,holder_3)),);
                    // AffirmationDetailScreen. roncount=roncount+1;
                    AffirmationDetailScreen.roncount =
                        AffirmationDetailScreen.roncount + 1;
                    if (AffirmationDetailScreen.roncount > TabsScreen.len1) {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FirstScreen(
                                    selectedAff.imageUrl,
                                    selectedAff.title,
                                    AffirmationDetailScreen.holder_3,
                                    AffirmationDetailScreen.ttlist,
                                    AffirmationDetailScreen.imglist,
                                    AffirmationDetailScreen.audiolist)));
                      });
                    }
                    Navigator.of(context).pushNamed(
                      CategoryAffirmationScreen.routeName,
                      arguments: {
                        'id': CategoryItem
                            .idlist2[AffirmationDetailScreen.roncount]
                            .toString(),
                        'title': CategoryItem
                            .tlist2[AffirmationDetailScreen.roncount]
                            .toString(),
                      },
                    );
                  },
                ),
                //buildSectionTitle(context, 'Affirmations'),
                //buildSectionTitle(context),
                buildContainer(
                  // ListView.builder(

                  //   itemBuilder: (ctx, index) => Card(
                  //         color: Theme.of(context).primaryColor,
                  //         child: Padding(
                  //             padding: EdgeInsets.symmetric(
                  //               vertical: 5,
                  //               horizontal: 10,
                  //             ),
                  //             child:// RaisedButton(child: index>=2?Row(
                  // children: <Widget>[ ],
                  //):
                  ListView(
                    children: map2.keys.map((String key) {
                      if (count2 < 3) {
                        count2 = count2 + 1;
                        return new CheckboxListTile(
                          title: new Text(key),
                          value: map2[key],
                          activeColor: Color.fromRGBO(255, 185, 0, 1),
                          checkColor: Colors.white,
                          onChanged: (bool value) {
                            setState(() {
                              map2[key] = value;
                            });
                          },
                        );
                      } else {
                        count2 = count2 + 1;

                        return new CheckboxListTile(
                          secondary: const Icon(Icons.lock),
                          title: new Text(key),
                          value: map2[key],
                          activeColor: Colors.deepPurple[400],
                          checkColor: Colors.white,
                          onChanged: (bool value) {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext bContext) {
                                  return Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(10),
                                        topRight: const Radius.circular(10),
                                      )),
                                      child: Material(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(
                                                "Become a Premium Member",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24,
                                                    color: Color(0xffF8BC24)),
                                              ),
                                            ),
                                            Material(
                                              child: Column(children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.star_border),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Text(
                                                          "   Mirror",
                                                          style: TextStyle(
                                                              fontSize: 18.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.star_border),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Text(
                                                          "   Multi-Language",
                                                          style: TextStyle(
                                                              fontSize: 18.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.star_border),
                                                      Text(
                                                        "    List of affirmations",
                                                        style: TextStyle(
                                                            fontSize: 18.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                            ),
                                            Material(
                                              child: Column(children: [
                                                Row(children: [
                                                  Card(
                                                    child: InkWell(
                                                        child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                3,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                4.5,
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(30.0),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .orange,
                                                                    border: Border.all(
                                                                        color: Colors.pink[800], // set border color
                                                                        width: 3.0), // set border width
                                                                    borderRadius: BorderRadius.all(Radius.circular(4.0)), // set rounded corner radius
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      blurRadius:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                      offset:
                                                                          Offset(
                                                                              1,
                                                                              3))
                                                                ] // make rounded corner of border
                                                                    ),
                                                            child: Column(
                                                                children: [
                                                                  Text("  "),
                                                                  Text("  "),
                                                                  Center(
                                                                    child: Text(
                                                                      "Rs. 99/Month",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              24.0),
                                                                    ),
                                                                  )
                                                                ])),
                                                        onTap: openCheckout),
                                                  ),
                                                  Expanded(
                                                    child: Card(
                                                      child: InkWell(
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                3,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                4.5,
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(30.0),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .orange,
                                                                    border: Border.all(
                                                                        color: Colors.pink[800], // set border color
                                                                        width: 3.0), // set border width
                                                                    borderRadius: BorderRadius.all(Radius.circular(4.0)), // set rounded corner radius
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      blurRadius:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                      offset:
                                                                          Offset(
                                                                              1,
                                                                              3))
                                                                ] // make rounded corner of border
                                                                    ),
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  "Rs. 1188",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        17.0,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "30% off!",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        11.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "Rs. 730/",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        24.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "Year",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "(ie Rs. 2/day - for self improvement)",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                    fontSize:
                                                                        8.0,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          onTap: openCheckout2),
                                                    ),
                                                  ),
                                                ]),
                                              ]),
                                            ),
                                            Expanded(
                                                child: SliderButton(
                                              backgroundColor: Colors.amber,
                                              width: 200,
                                              action: openCheckout,
                                              label: Text(
                                                "Pay Now",
                                                style: TextStyle(
                                                    color: Color(0xff1A4645),
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 24),
                                              ),
                                              icon: Text(
                                                "x",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 34,
                                                ),
                                              ),
                                            )),
                                          ],
                                        ),
                                      ));
                                });
                          },
                        );
                      }
                    }).toList(),
                  ),

                  //     onPressed: index>=2?() { }:()=>onPlayAudio(selectedAff.audioName[index]),
                  //),

                  //  ),
                  // ),
                  // itemCount: selectedAff.affirmations.length,
                  //),
                  //),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            widget.isFavorite(mealId) ? Icons.star : Icons.star_border,
          ),
          onPressed: () => widget.toggleFavorite(mealId),
        ),
      ),
    );
  }

/*
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }
*/

  void showSheet() {}
  void openCheckout() async {
    var options = {
      //'key': 'rzp_live_HSO9hrKe80xgAm', //company
      'key': 'rzp_test_xxanvUvjLYcdli', //akshit
      'amount': 1,
      'name': 'Company.',
      'description': 'Affirmation',
      'prefill': {'contact': '9137028272', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void openCheckout2() async {
    var options = {
      //'key': 'rzp_live_HSO9hrKe80xgAm', //company
      'key': 'rzp_test_xxanvUvjLYcdli', //akshit
      'amount': 73000,
      'name': 'Company.',
      'description': 'Affirmation',
      'prefill': {'contact': '9137028272', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Fluttertoast.showToast(
    //msg: "SUCCESS: " + response.paymentId, timeInSecForIos: 40);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Success(response.paymentId)),
    );
  }

  _handlePaymentError(PaymentFailureResponse response) {
    //Fluttertoast.showToast(
    // msg: "ERROR: " + response.code.toString() + " - " + response.message, timeInSecForIos: 40);

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Failure(response.code, response.message)),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }

  Widget _animatedButton() {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              //Color(0xff33ccff),
              //Color(0xffff99cc),
              Color.fromRGBO(255, 185, 0, 1),
              Color.fromRGBO(255, 144, 147, 1),
            ],
          )),
      child: Center(
        child: Text(
          'Submit',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
