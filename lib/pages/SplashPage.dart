import 'package:flutter/material.dart';
import 'package:smart_tel/pages/OnGoingPage.dart';
import 'package:smart_tel/serv/NavService.dart';

class SplashPage extends StatelessWidget {
  static String routeName='SplashPage';

  transferToNextPage()async{
    await Future.delayed(const Duration(seconds: 3));
    NavServices.navServices.NavRep(OnGoingPage.routeName);

  }



  @override
  Widget build(BuildContext context) {

    transferToNextPage();
    return Scaffold(
      body: Center(child: Container(

          width: double.infinity,
        height: 230,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          image: const DecorationImage(image: AssetImage('images/logo.png'),fit: BoxFit.fill,),),)
        ),



    );
  }
}





