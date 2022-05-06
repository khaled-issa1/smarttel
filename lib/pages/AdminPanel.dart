import 'package:flutter/material.dart';
import 'package:smart_tel/pages/DeviceAddPage.dart';
import 'package:smart_tel/pages/DeviceDeletePage.dart';
import 'package:smart_tel/pages/HomePage.dart';
import 'package:smart_tel/serv/NavService.dart';

class AdminPanel extends StatelessWidget {
  static String routeName='AdminPanel';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            
            SafeArea(
              child: Container(
                width: double.infinity,
                  height: 250,
                  child: const Image(image: AssetImage('images/logo.png'),fit: BoxFit.fill,)),
            ),

            const SizedBox(height: 50,),

            
            InkWell(
              onTap: (){NavServices.navServices.NavPush(DeviceAddPage.routeName);},
              child: Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                child: Card(
                  color:  const Color(0xff0e3d7d),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child:Row(
                    children: const [
                       Image(image: AssetImage('images/ic2.png'),color: Colors.white,)
                      , Text('Add New Device to app',style:
                      TextStyle(color: Colors.white,fontWeight: FontWeight.w500
                      ),)],
                  )

                ),
              ),
            ),


            InkWell(
              onTap: (){NavServices.navServices.NavPush(DeviceDeletePage.routeName);},
              child: Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                child: Card(
                    color:  const Color(0xff0e3d7d),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child:Row(
                      children: const [
                         Image(image: AssetImage('images/ic2.png'),color: Colors.white,)
                        , Text('Delete Device from app',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)],
                    )

                ),
              ),
            ),

            InkWell(
              onTap: (){NavServices.navServices.NavRep(HomePage.routeName);},
              child: Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                child: Card(
                    color:  const Color(0xff0e3d7d),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child:Row(
                      children: const [
                         Image(image: AssetImage('images/ic2.png'),color: Colors.white,)
                        , Text('Return to Home Page',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)],
                    )

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
