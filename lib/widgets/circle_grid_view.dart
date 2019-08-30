import 'package:flutter/material.dart';
import '../modul/circle_grid_list.dart' as circleList;
class CircleGridView extends StatefulWidget {
  @override
  _CircleGridViewState createState() => _CircleGridViewState();
}

class _CircleGridViewState extends State<CircleGridView> {
  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, mainAxisSpacing: 22.0),
      itemCount: circleList.list.length,
      itemBuilder: (BuildContext context, int index) {
        return new GridTile(
          footer: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Flexible(
                  child: new SizedBox(
                    height: 19.0,
                    width: 100.0,
                    child: new Text(
                      circleList.list[index]["name"],
                      maxLines: 4,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ]),
          child: new Container(
            height: 200.0,
            child: new GestureDetector(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new SizedBox(
                    height: 70.0,
                    width: 80.0,
                    child: new Row(
                      children: <Widget>[
                        new Stack(
                          children: <Widget>[
                            new SizedBox(
                              child: new Container(
                                child: new CircleAvatar(
                                  backgroundColor: circleList.list[index]["bagroundColor"],
                                  radius: 40.0,
                                  child: new Icon(
                                      circleList.list[index]
                                      ["icon"],
                                      size: 30.0,
                                      color: circleList.list[index]
                                      ["color"]),
                                ),
//                                        padding: const EdgeInsets.only(
//                                            left: 10.0, right: 10.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              onTap: () {

              },
            ),
          ),
        );
      },
    );

  }
}
