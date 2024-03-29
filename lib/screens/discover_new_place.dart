import 'package:flutter/material.dart';
import '../widgets/all_widgets_defintion.dart';

class DiscoverNewPlace extends StatefulWidget {
  @override
  _DiscoverNewPlaceState createState() => _DiscoverNewPlaceState();
}

class _DiscoverNewPlaceState extends State<DiscoverNewPlace> {
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Color.fromARGB(255, 249, 250, 252),
          body: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: <Widget>[
                    _locationDeatilsTop(context),
                  _discoberPlaceHint(context),
                    CarouselStarRateDetails(),
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

   _discoberPlaceHint(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        S.of(context).discover_new_place,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                    ],
                  ),
    );
  }

  Row _locationDeatilsTop(BuildContext context) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: LoyaltySearchInput(
                          label: S.of(context).search_lbl,
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(_getProfileImagePath()),
                      )
                    ],
                  );
  }

  _getProfileImagePath() {
    return "assets/profile-pic.jpg";
  }
}
