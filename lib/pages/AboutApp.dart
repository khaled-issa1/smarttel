import 'package:flutter/material.dart';
import 'package:smart_tel/customWidgets/AppDrawer.dart';

class AboutApp extends StatelessWidget {
  static String routeName='AboutApp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: const Text('About App',),centerTitle: true,backgroundColor: const Color(0xff0e3d7d),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const SizedBox(height: 60,),
          const Text('What is Smart Tell',style: TextStyle(color: Color(0xff0e3d7d),fontWeight: FontWeight.w700,fontSize: 20),),
          const SizedBox(height: 40,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              width: double.infinity,
              child: const Text(' Smart Tell is a smart system used Internet of Thing Technology to faciliate control of Home Devices using mobile app and wifi connection',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
              ),
            ),
          ),

          const SizedBox(height: 40,),
          Container(
            height: 300,
            width: double.infinity,
            child: const Image(image: AssetImage('images/logo.png'),fit: BoxFit.fill,),)
        ],
      ),

    );
  }
}
