import 'package:easy_go/navigation/navigationHandler.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_bottom_tap.dart';
import '../widgets/all_widgets_defintion.dart';
import 'package:carousel_slider/carousel_slider.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var paddingLeft = 12.0 ;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Color.fromARGB(255, 249, 250, 252 ),

          body: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: ListView(
                  children: <Widget>[
                    _homeHeaderBar(),
                    _circleGridViewWidget(),
                    Divider(height: 5),
                    _destinationHeaderWidget(context),
                    _destinationCarouselWidget(context),
                    _dealHeaderWidget(context),
                    _dealsGridImageWidget(context),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: CustomTabBar(),
        ),
      ],
    );
  }

   _circleGridViewWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
                      child: CircleGridView(),
                      height: 100,
                    ),
    );
  }
  _getGridImageList(){
    List dealImagesList = [
    "assets/deal-image1.jpg",
    "assets/deal-image2.jpg",
    ];
    return dealImagesList;
  }
   _dealsGridImageWidget(BuildContext context) {
    List _dealImagesList = _getGridImageList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5 -paddingLeft/2,
                      height: 170,
                      child: new Card(
                          child: new ClipRRect(
                        borderRadius: new BorderRadius.circular(5.0),
                        child: Image.asset(
                          _dealImagesList[0],
                          fit: BoxFit.fill,
                        ),
                      )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5 - paddingLeft/2,
                      height: 170,
                      child: new Card(
                          child: new ClipRRect(
                        borderRadius: new BorderRadius.circular(5.0),
                        child: Image.asset(
                          _dealImagesList[1],

                          fit: BoxFit.fill,
                        ),
                      )),
                    ),
                  ],
                );
  }

   _dealHeaderWidget(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                    S.of(context).deals_lbl,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        S.of(context).view_all_lbl,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        NavigationHandler.navigateTo(context, '/locationdetails', passedData:"locationData");

                      },
                    ),
                  ],
                );
  }

   _destinationCarouselWidget(BuildContext context) {
    return CarouselLovedDestination();
  }

   _destinationHeaderWidget(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      S.of(context).destination_we_love_lbl,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        S.of(context).view_all_lbl,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        NavigationHandler.navigateTo(context, '/newplace', passedData:"aliaa");

                      },
                    ),
                  ],
                );
  }
  _homeHeaderBar(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10.0, 10.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            child:Icon(FontAwesomeIcons.sortAmountUp) ,
            onTap: (){},
          ),
          InkWell(
            child:Icon(FontAwesomeIcons.search) ,
            onTap: (){})
        ],
      ),
    );
  }
}
