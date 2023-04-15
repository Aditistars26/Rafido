import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_osm_interface/flutter_osm_interface.dart';
import 'package:flutter_osm_web/flutter_osm_web.dart';
import 'package:flutter_osm_web/src/controller/web_osm_controller.dart';


class Utils {
  static void FieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextfocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.black12);
    textColors:
    Colors.green;
    toastlength:
    10.0;
    msg:
    message;
    backgroundColor:
    Colors.black;
  }

  static void flushBarErrorMesssage(message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        backgroundColor: Colors.red,
        title: "HAPPY",
        forwardAnimationCurve: Curves.easeOut,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        reverseAnimationCurve: Curves.easeInOut,
        duration: Duration(seconds: 3),
        positionOffset: 20,
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(20.0),
        icon: Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static SnakBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }

  MapController controller = MapController.withPosition(
                            initPosition: GeoPoint(
                              latitude: 47.4358055,
                               longitude: 8.4737324
                            ,),
                            areaLimit: BoundingBox( 
                                east: 10.4922941, 
                                north: 47.8084648, 
                                south: 45.817995, 
                                west:  5.9559113,
                            ),
            );

}
