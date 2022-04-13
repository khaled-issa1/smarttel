import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_tel/pages/AboutApp.dart';
import 'package:smart_tel/pages/AdminPanel.dart';
import 'package:smart_tel/pages/ContactUs.dart';
import 'package:smart_tel/pages/DeviceAddPage.dart';
import 'package:smart_tel/pages/HomePage.dart';
import 'package:smart_tel/serv/NavService.dart';


class DrawerMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      color: Colors.white,


      child: Column(
        children: [
          SizedBox(
            height: 300,
          ),


          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color: Color(0xffd9d9d9),),
            width: 200,

            child: TextButton(onPressed: (){
              NavServices.navServices.NavRep(HomePage.routeName);

            }, child: Text('Home Page',style: TextStyle(color: Color(0xff0e3d7d),fontSize: 20),)),
          ),

          SizedBox(height: 30,),

          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color: Color(0xffd9d9d9),),
            width: 200,
            child: TextButton(onPressed: (){
              NavServices.navServices.NavRep(AboutApp.routeName);
            }, child: Text('About App',style: TextStyle(color: Color(0xff0e3d7d),fontSize: 20),)),
          ),
          SizedBox(height: 30,),
          Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                color: Color(0xffd9d9d9),),
              width: 200,
              child: TextButton(onPressed: (){
                NavServices.navServices.NavRep(ContactUs.routeName);
              }, child: Text('Contact Us',style: TextStyle(color: Color(0xff0e3d7d),fontSize: 20),))),
           SizedBox(height: 30,),

          Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                color: Color(0xffd9d9d9),),
              width: 200,
              child: TextButton(onPressed: (){
                NavServices.navServices.NavPush(AdminPanel.routeName);
              }, child: Text('Admin Panel',style: TextStyle(color: Color(0xff0e3d7d),fontSize: 20),))),
          SizedBox(height: 30,),
          Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                color: Color(0xffd9d9d9),),
              width: 200,
              child: TextButton(onPressed: (){

                showDialog(context: context, builder: (context){
                  return  AlertDialog(
                    content: Text(" Are you sure you want to close app",style: TextStyle(color: Color(0xff0e3d7d),fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                    actions: [
                      TextButton(
                        child: Text("No",style: TextStyle(color: Color(0xff0e3d7d),fontSize: 15,fontWeight: FontWeight.bold),),
                        onPressed:  () {
                          Navigator.pop(context);
                        },
                      ),

                      TextButton(
                        child: Text("yes",style: TextStyle(color: Color(0xff0e3d7d),fontSize: 15,fontWeight: FontWeight.bold),),
                        onPressed:  () {
                          if (Platform.isAndroid) {
                            SystemNavigator.pop();
                          } else if (Platform.isIOS) {
                            exit(0);
                          }
                        },
                      ),
                    ],
                  );
                });

              }, child: Text('Exit',style: TextStyle(color: Color(0xff0e3d7d),fontSize: 20),))),

        ],
      ),
    );
  }
}
