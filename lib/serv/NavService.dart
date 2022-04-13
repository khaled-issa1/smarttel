import 'package:flutter/material.dart';

class NavServices{

  late GlobalKey<NavigatorState> navkey;

  NavServices._(){
    navkey=GlobalKey<NavigatorState>();
  }

  static NavServices navServices=NavServices._();

  NavRep(String x){
    navkey.currentState?.pushReplacementNamed(x);
  }

  NavPush(String x){
    navkey.currentState?.pushNamed(x);
  }


}