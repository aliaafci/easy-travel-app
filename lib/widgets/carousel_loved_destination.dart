import 'package:flutter/material.dart';
import '../modul/destination_we_love_list.dart'as destinationObject;
import 'all_widgets_defintion.dart';
class CarouselLovedDestination extends StatefulWidget {
  @override
  _CarouselLovedDestinationState createState() => _CarouselLovedDestinationState();
}

class _CarouselLovedDestinationState extends State<CarouselLovedDestination> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 200,
      height: 200,
      child: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          Positioned(
              left: currentIndex == 0?  -63.0 :0  ,
              right: 0.0,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  enlargeCenterPage: false,
                  viewportFraction: 0.7,
                  height: 300,
                  onPageChanged: (index){
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  items: destinationObject.list.map((lovedDestinationObject) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                width: MediaQuery.of(context)
                                    .size
                                    .width,
                                child: new Card(
                                  child: new ClipRRect(
                                    borderRadius:
                                    new BorderRadius.circular(
                                        5.0),
                                    child: Image.asset(
                                      lovedDestinationObject["image"],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                height: 150,
                              ),
                              onTap: (){

                              },
                            ),
                            Text(
                        lovedDestinationObject["text"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(lovedDestinationObject["subText"])
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
              ))
        ],
      ),
    );
  }
//  _getLift(){
//    return destinationListLength != currentIndex+1?  -63.0 :4 ;
//  }
}
