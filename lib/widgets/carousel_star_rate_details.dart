import 'package:flutter/material.dart';
import 'all_widgets_defintion.dart';
import '../modul/carousel_star_rate_list_details.dart' as carouselDetailsList;

class CarouselStarRateDetails extends StatefulWidget {
  @override
  _CarouselStarRateDetailsState createState() =>
      _CarouselStarRateDetailsState();
}

class _CarouselStarRateDetailsState extends State<CarouselStarRateDetails> {
  @override
  Widget build(BuildContext context) {
    var containerHeight = MediaQuery.of(context).size.height * 0.77;
    print("first height $containerHeight");
    var carouselDetailsPadding = containerHeight * 0.55;
    return Container(
      width: 300,
      height: containerHeight,
      child: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          Positioned(
              left: -20.0,
              right: 0.0,
              child: Container(
                height: containerHeight,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  height: containerHeight,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  items: carouselDetailsList.list.map((detailObject) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                          child: _carouselContainer(detailObject,
                              containerHeight, carouselDetailsPadding, context),
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

  _carouselContainer(
      detailObject, containerHeight, carouselDetailsPadding, context2) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: containerHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(detailObject["bagroundImage"]), fit: BoxFit.fill),
        borderRadius: new BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          _placeNameWidget(detailObject),
          Padding(
              padding: EdgeInsets.fromLTRB(6.0, carouselDetailsPadding, 6.0, 0),
              child: _carouselContainerData(detailObject)),
        ],
      ),
    );
  }

  _placeNameWidget(detailObject) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0,left: 4.0,top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.white,
                size: 17,
              ),
              Text(detailObject["locationName"],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),)
            ],
          ),
          Icon(
            Icons.bookmark,
            color: Color.fromARGB(255, 239, 22, 84 ),
            size: 20,
          ),
        ],
      ),
    );
  }

  _carouselContainerData(detailObject) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _descriptionDetailContainer(detailObject),
        _starRatingContainer(detailObject),
        _bottomContainerDetails(detailObject)
      ],
    );
  }

  _starRatingContainer(detailObject) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: StarRating(
        onChanged: (index) {},
        value: detailObject["rate"],
      ),
    );
  }

  Container _descriptionDetailContainer(detailObject) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Text(
        detailObject["description"],
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
      ),
    );
  }

  _bottomContainerDetails(detailObject) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            detailObject["price"],
            style: TextStyle(color: Colors.white),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              Text(
                detailObject["favNum"],
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
