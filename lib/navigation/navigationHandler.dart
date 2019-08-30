import 'package:flutter/material.dart';
import 'page_transaction.dart';
import 'dart:async';
import 'all_routs_defintion.dart';
class NavigationHandler {
  ///
  /// [passedDataToPreviousRoute]  optional param for if needed to back with data
  ///
  static bool backToPrevious(BuildContext context,
      {passedDataToPreviousRoute}) {
    bool navData = Navigator.of(context).pop(passedDataToPreviousRoute);
    return navData;
  }
///
  ///  we call it to fetch passed data for each screen needed  data
  ///
  static getPassedData(BuildContext context) {
    Object passedData = ModalRoute.of(context).settings.arguments;
    return passedData;
  }
///
  ///  navigateTo this function is used to handle navigation through routes
  /// [path] mandatory param for route name
  /// [replace] optional param if you need to replace current route by passed route
  /// [clearStack] optional param if you need to add route as main screen
  /// [passedData] optional param if you need to nav to route with data
  ///
  static Future navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      Object passedData}) {
    // check if the current route equal to passed route
    if (ModalRoute.of(context).settings.name == path) {
      replace = true;
    }

    Completer completer = new Completer();
    Future future = completer.future;

    if (path != null) {
      if (clearStack) {
        future = Navigator.pushNamedAndRemoveUntil(
            context, path, (check) => false,
            arguments: passedData);
      } else {
        future = replace
            ? Navigator.pushReplacementNamed(context, path,
                arguments: passedData)
            : Navigator.pushNamed(context, path, arguments: passedData);
      }
      completer.complete();
    } else {
      String error = "No registered route was found to handle '$path'.";
      print(error);
    }

    return future;
  }

///
  /// getRoute this function is used to return generated route with it's transaction type
  /// [settings] param passed from onGenerateRoute this param contain all data about route
  /// - to add new route you must add new case for a new route
  ///
  ///
  static Route getRoute(RouteSettings settings) {
    if (settings.name != null) {
      switch (settings.name) {
        case '/':
          return PageTransition(
              child:MyHomePage(),
              type: PageTransitionType.upToDown,
              setting: settings);
          break;
        case '/newplace':
          return PageTransition(
              child: DiscoverNewPlace(),
              type: PageTransitionType.rightToLeftWithFade,
              setting: settings);
          break;
        case '/locationdetails':
          return PageTransition(
              child: LocationDetails(),
              type: PageTransitionType.rightToLeftWithFade,
              setting: settings);
          break;
        default:
                return PageTransition(
              child:MyHomePage(),
              type: PageTransitionType.upToDown,
              setting: settings);;
      }
    } else {
      return PageTransition(
          child:MyHomePage(),
          type: PageTransitionType.upToDown,
          setting: settings);;
    }
  }
}
