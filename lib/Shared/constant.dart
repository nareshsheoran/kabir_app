import 'package:flutter/material.dart';

class Constant {
  static final Color primaryColor = Colors.pink;
  static final Color iconColor = Colors.yellowAccent;
  static final Color textColor = Colors.white;

  static final IconData icon = Icons.video_call_sharp;


}

class NetworkUtil {
  static const String BaseUrl = "http://aikahosts.com";
  static const String getSliderUrl = BaseUrl+"/matka/Api/user/get_sliders";
  static const String getStandardGameNameUrl = BaseUrl+"/matka/Api/user/get_standard_gamename";
}
