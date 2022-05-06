import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tel/pages/HomePage.dart';
import 'package:smart_tel/pages/OnGoingPage.dart';
import 'package:smart_tel/serv/NavService.dart';
import 'package:smart_tel/serv/ProviderHelper.dart';

class ErrorConnection extends StatelessWidget {

  static String routeName='ErrorConnection';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Container(width: double.infinity,),

          const SizedBox(height: 180,),


          Stack(
            children: const [
               Positioned(child: Icon(Icons.wifi,size: 150,color: Colors.grey,)),
               Positioned(left:45,top: 40
                ,child:  Icon(Icons.close,size: 65,color: Colors.red,),)
            ],
          ),



          const SizedBox(height: 40,),
          const Text('Network Connection Failed!'),
          const Text('Please check your connection then retry'),

          const SizedBox(height: 20,),
          IconButton(onPressed: ()async{
            var connectivityResult = await (Connectivity().checkConnectivity());
            if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi ) {
              NavServices.navServices.NavRep(OnGoingPage.routeName);
            } else  {
              NavServices.navServices.NavRep(ErrorConnection.routeName);


            }

          }, icon:const Icon(Icons.refresh,size: 40,color: Colors.green,)),
        ],
      ),
    );
  }
}
