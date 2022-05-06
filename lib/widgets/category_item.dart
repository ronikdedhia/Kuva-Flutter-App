import 'package:flutter/material.dart';
import '../screen/Category_affirmation_screen.dart';

class CategoryItem extends StatefulWidget {
  final String id;
  final String title;
  Color color;
  Color color2;
  final Icon iconname;
  static List tlist2 = [""];
  static List idlist2 = [""];
  CategoryItem(this.id, this.title, this.color, this.color2, this.iconname);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  final List tlist1 = [""];
  final List idlist1 = [""];
  //Color color2=widget.color;
  var flag = 0;
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryAffirmationScreen.routeName,
      arguments: {
        'id': widget.id,
        'title': widget.title,
      },
    );
  }

  building() {
    setState(() {
      flag == 1 ? widget.color = Colors.amber : widget.color = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        flag == 0 ? flag = 1 : flag = 0;

        print(widget.title + " flag is ");
        print(flag);
        setState(() {
          if (flag == 0) {
            widget.color = widget.color2;
            CategoryItem.tlist2.remove(widget.title);
            CategoryItem.idlist2.remove(widget.id);
          } else {
            widget.color = Color.fromRGBO(140, 103, 172, 1).withOpacity(0.25);

            //flag=1;
            print(widget.title);
            tlist1.add(widget.title);
            idlist1.add(widget.id);
            CategoryItem.tlist2 = CategoryItem.tlist2 + tlist1;
            CategoryItem.idlist2 = CategoryItem.idlist2 + idlist1;
            //print(tlist2);

            //   Items(widget.title);

            //Navigator.push(context, MaterialPageRoute(builder: (context) =>Items(widget.title)),);
          }
        });
      },
      child: InkWell(
        //onTap: () => selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              widget.iconname,
              Text("   "),
              Expanded(
                              child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                //building(),

                widget.color.withOpacity(0.7),
                widget.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
