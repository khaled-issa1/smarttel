import 'package:flutter/material.dart';

class NavServices{

  GlobalKey<NavigatorState> pageNavKey=GlobalKey<NavigatorState>();

  NavServices._(){
    pageNavKey=GlobalKey<NavigatorState>();
  }

  static NavServices navServices=NavServices._();

  NavRep(String x){
    pageNavKey.currentState?.pushReplacementNamed(x);
  }

  NavPush(String x){
    pageNavKey.currentState?.pushNamed(x);
  }


}