import 'package:flutter/material.dart';

class TaskRow extends StatefulWidget {
  final List task;
  final Animation<double> animation;

  const TaskRow({Key key, this.task, this.animation}) : super(key: key);

  @override
  _TaskRowState createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  final double dotSize = 12.0;
  var count = 1;

  @override
  Widget build(BuildContext context) {
    print('Task');
    print(widget.task);
    return new FadeTransition(
      opacity: widget.animation,
      child: new SizeTransition(
        sizeFactor: widget.animation,
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: new Row(
            children: <Widget>[
              new Padding(
                padding:
                    new EdgeInsets.symmetric(horizontal: 32.0 - dotSize / 2),
                child: new Container(
                  height: dotSize,
                  width: dotSize,
                  decoration: new BoxDecoration(shape: BoxShape.circle),
                ),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) => Text(
                              count == 1
                                  ? widget.task[index]
                                  : count = count + 1,
                              style: new TextStyle(fontSize: 18.0),
                            ),
                        itemCount: widget.task.length),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
