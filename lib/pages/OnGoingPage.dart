import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:smart_tel/pages/ErrorConnection.dart';
import 'package:smart_tel/pages/HomePage.dart';
import 'package:smart_tel/pages/LoginPage.dart';
import 'package:smart_tel/serv/NavService.dart';
import 'package:smart_tel/serv/ProviderHelper.dart';
import 'package:smart_tel/serv/SPHelper.dart';


class OnGoingPage extends StatelessWidget {

  static String routeName='OnGoingPage';
  double w=300;
  double h=80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const SizedBox(height: 100,),


          CarouselSlider(
              items: [

                Container(

                  height: h,
                  width: w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage('images/logo.png'),
                      fit: BoxFit.fill,

                    ),
                  ),
                ) ,
                Container(
                  width: w,
                  height: h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image:  AssetImage('images/sh2.jpg'),
                      fit: BoxFit.fill,

                    ),
                  ),
                ) ,

                Container(
                  width: w,
                  height: h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage('images/back1.jpg'),
                      fit: BoxFit.fill,

                    ),
                  ),
                ) ,
                Container(
                  width: w,
                  height: h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage('images/headphone.jpg'),
                      fit: BoxFit.fill,

                    ),
                  ),
                ) ,
              ]
              ,
              options: CarouselOptions(
                height: 250,
                aspectRatio: 16/9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,

                scrollDirection: Axis.horizontal,
              )
          ),




          const SizedBox(height: 50,),

          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),

            child: const Text(
              'Welcome in Smart Tel app \n\n',

              textAlign: TextAlign.center,
              style:  TextStyle(color: Color(0xff0e3d7d),
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),

            ),),
          const SizedBox(height: 30,),

          Container(

            width: double.infinity,

            margin: const EdgeInsets.symmetric(vertical: 50
                ,horizontal: 30),

            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color: const Color(0xffd9d9d9),
            ),
            child: TextButton(
              child: const Text('Next',
                style: TextStyle(color: Color(0xff0e3d7d)),
              ),

              onPressed: ()async{
                bool? ss=await SPHelper.spHelper.isAuth();
                var connectivityResult = await (Connectivity().checkConnectivity());
                if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi ) {
                  if(ss==true){
                    Provider.of<ProviderHelper>(context,listen:false).avilableDevices();
                    NavServices.navServices.NavRep(HomePage.routeName);
                  }else {NavServices.navServices.NavPush(LoginPage.routeName);}

                } else  {
                  NavServices.navServices.NavRep(ErrorConnection.routeName);


                }


              },
            ),
          )




        ],
      ),
    );
  }
}
