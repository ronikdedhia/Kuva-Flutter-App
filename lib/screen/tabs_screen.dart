import 'package:flutter/material.dart';
import 'package:kuva/screen/affirmation_detail_screen.dart';
import 'package:kuva/screen/categories_screen.dart';
import 'package:kuva/widgets/category_item.dart';
import 'Category_affirmation_screen.dart';

class TabsScreen extends StatefulWidget {
  static var len1;
  int akflag = 0;
  TabsScreen();

  @override
  _TabsScreen createState() => _TabsScreen();
}

class _TabsScreen extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  var akid;
  var aktt;
  int _selectedPageindex = 0;
  List<Map<String, Object>> _pages;
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
    ];
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
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageindex = index;
    });
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(_pages[_selectedPageindex]['title'],
              style: TextStyle(fontSize: 25)),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                CategoryItem.tlist2.toSet().toList();
                CategoryItem.tlist2 = CategoryItem.tlist2.toSet().toList();
                CategoryItem.idlist2.toSet().toList();
                CategoryItem.idlist2 = CategoryItem.idlist2.toSet().toList();
                print(CategoryItem.tlist2);
                aktt = CategoryItem.tlist2[1];
                akid = CategoryItem.idlist2[1];
                print('AK id is');
                print(akid);
                print(aktt);
                //      Navigator.of(context).pushNamed(
                //    CategoryAffirmationScreen.routeName,

                //    arguments: {
                //      'id':CategoryItem.idlist2[1].toString() ,
                //      'title': CategoryItem.tlist2[1].toString(),
                //    },
                //  );

                print('Id are:');
                print(CategoryItem.idlist2);
                print(CategoryItem.tlist2[0]);
                print(CategoryItem.tlist2[1]);
                TabsScreen.len1 = (CategoryItem.tlist2.length) - 1;
                //CategoryItem.tlist2[0]=null;

                //     for(var i=len1;i>=1;i--)
                //     {
                //      if(AffirmationDetailScreen.flag==1)
                //      {
                //       Navigator.of(context).pushNamed(
                //    CategoryAffirmationScreen.routeName,

                //    arguments: {
                //      'id':CategoryItem.idlist2[i].toString() ,
                //      'title': CategoryItem.tlist2[i].toString(),
                //    },
                //  );
                //  AffirmationDetailScreen.flag=0;
                //      }
                //      else
                //      {
                //        print("Not executed");
                //        AffirmationDetailScreen.flag=1;
                //      }
                //     }

                Navigator.of(context).pushNamed(
                  CategoryAffirmationScreen.routeName,
                  arguments: {
                    'id': CategoryItem.idlist2[AffirmationDetailScreen.roncount]
                        .toString(),
                    'title': CategoryItem
                        .tlist2[AffirmationDetailScreen.roncount]
                        .toString(),
                  },
                );
              },
              onTapDown: _tapDown,
              onTapUp: _tapUp,
              child: Transform.scale(
                scale: _scale,
                child: _animatedButton(),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
        body: _pages[_selectedPageindex]['page'],

        // bottomNavigationBar: BottomNavigationBar(
        //   onTap: _selectPage,
        //   backgroundColor: Theme.of(context).primaryColor,
        //   unselectedItemColor: Colors.white,
        //   selectedItemColor: Theme.of(context).accentColor,
        //   currentIndex: _selectedPageindex,
        //   //type: BottomNavigationBarType.shifting,
        //   items: [BottomNavigationBarItem(backgroundColor:  Theme.of(context).primaryColor,icon:
        //   Icon(Icons.category),title:Text('Categories')),
        //   BottomNavigationBarItem(backgroundColor:  Theme.of(context).primaryColor,icon:
        //   Icon(Icons.star),title:Text('Favroites')),
        //   ]),
      ),
    );
  }

  Widget _animatedButton() {
    return Container(
      height: 70,
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
