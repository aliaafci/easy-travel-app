import 'package:easy_go/navigation/navigationHandler.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../modul/location_details.dart' as LocationDetailsObj;
import '../widgets/all_widgets_defintion.dart';

class LocationDetails extends StatefulWidget {
  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  @override
  Widget build(BuildContext context) {
    var headerContainerHeight = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
          backgroundColor: Colors.transparent,


        body: Container(


        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(LocationDetailsObj.locationDetails["placeImageHint"]),
              fit:   BoxFit.fill,
            ),
          ),
          child: Stack(
      children: <Widget>[
          ListView(
            scrollDirection:Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              _topHeaderContainer(LocationDetailsObj.locationDetails,
                  headerContainerHeight, context),
      ListView(
        scrollDirection:Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          _locationCardWidget(LocationDetailsObj.locationDetails, context,
              headerContainerHeight)
        ],
      )

            ],
          ),
      ],
    ),
        ));
  }

  _topHeaderContainer(locationDetails, headerContainerHeight, context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: headerContainerHeight,
      alignment: AlignmentDirectional(-1.0, -1.0),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(locationDetails["placeImageHint"]),
              fit: BoxFit.fill),
      ),
      child:
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              child: Icon(Icons.arrow_back,color: Colors.white,size: 28,),
              onTap: () {
                NavigationHandler.backToPrevious(context);
              },
            ),
            Row(

              children: <Widget>[
                InkWell(
                  child: Icon(FontAwesomeIcons.reply,color: Colors.white,size: 25,),
                  onTap: () {},
                ),
                InkWell(
                  child: Icon(FontAwesomeIcons.ellipsisV,color: Colors.white,size: 25,),
                  onTap: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _locationCardWidget(locationDetails, context, headerContainerHeight) {
    return Container(
//      alignment: AlignmentDirectional(-4.0, -4.0),

      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _placeNameContainer(locationDetails),
            _descriptionHintContainer(context, locationDetails),
            _rateContainer(locationDetails),
            _fullDescriptionContainer(context, locationDetails),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "PHOTOS",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            ImageGridView(
              crossAxisCount: 3,
              imagesList: locationDetails["placeImagesList"],
            ),
          ],
        ),
      ),
    );
  }

  Padding _descriptionHintContainer(context, locationDetails) {
    return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.88,
              ),
              child: Text(
                locationDetails["descriptionHint"],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black),
              ),
            ),
          );
  }

   _placeNameContainer(locationDetails) {
    return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.grey,
                size: 15,
              ),
              Text(
                locationDetails["placeName"],
                style: TextStyle(color: Colors.grey),
              )
            ],
          );
  }

   _fullDescriptionContainer(context, locationDetails) {
    return Padding(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(locationDetails["fullDescription"],style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black),),
              ),
              padding: EdgeInsets.only(top: 20.0));
  }

   _rateContainer(locationDetails) {
    return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StarRating(
                  onChanged: (index) {},
                  value: locationDetails["rates"],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0,left: 8.0),
                  child: Text(
                    locationDetails["reviews"],
                    style: TextStyle(color: Colors.grey,),
                  ),
                )
              ],
            ),
          );
  }
}
