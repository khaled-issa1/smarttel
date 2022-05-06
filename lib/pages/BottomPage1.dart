import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tel/backend/BackendHelper.dart';
import 'package:smart_tel/pages/DeviceControl1.dart';
import 'package:smart_tel/pages/DeviceControl2.dart';
import 'package:smart_tel/pages/DeviceControl3.dart';
import 'package:smart_tel/serv/ProviderHelper.dart';

class BottomPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       Consumer<ProviderHelper>(
         builder: (context,mm,v){

           return SingleChildScrollView(
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: Container(
                         child: const Text('Device'),
                       ),
                     ),

                     const SizedBox(width: 15,),

                     const Text(
                         'Name'
                     ),
                     const SizedBox(width: 30,),

                     const Text(
                         'ID'
                     ),
                     const SizedBox(width: 30,),

                     const Text(
                         'Ch No'
                     ),
                     const SizedBox(width: 10,),


                   ],


                 ),
                 const Divider(
                   thickness: 3,
                 ),

                 Container(
                   height: 500,
                   child: ListView.separated(

                     itemCount: mm.avd.length,
                     separatorBuilder: (context,i){
                       return const Divider(thickness: 3,);
                     },

                     itemBuilder: (context,i){

                       return Padding(
                           padding: const EdgeInsets.only(left: 3,bottom: 8,right: 20),
                           child: InkWell(
                             onTap: ()async{
                               List s=[false,false,false];

                               if(mm.avd[i].ch.length==1){

                                 s =await BackendHelper.backendHelper.deviceStatus(mm.avd[i].link.toString());

                                 Navigator.of(context).pushNamed(DeviceControl1.routeName,arguments: [mm.avd[i],s[0]]);
                               }else if(mm.avd[i].ch.length==2){
                                  s=await BackendHelper.backendHelper.deviceStatus(mm.avd[i].link.toString());

                                 Navigator.of(context).pushNamed(DeviceControl2.routeName,arguments: [mm.avd[i],s[0],s[1]]);

                               }else if(mm.avd[i].ch.length==3){
                                 dynamic s=await BackendHelper.backendHelper.deviceStatus(mm.avd[i].link.toString());

                                 Navigator.of(context).pushNamed(DeviceControl3.routeName,arguments: [mm.avd[i],s[0],s[1],s[2]]);

                               }

                             },
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [Card(

                                   child: Container(
                                     width: 40,
                                     height: 40,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(20),
                                         image: const DecorationImage(image: AssetImage('images/ic2.png'))
                                     ),),
                                 ),



                                   Stack(
                                     children: [
                                       Positioned(child: Text(mm.avd[i].name.toString())
                                       ),
                                     ],
                                   ),


                                   Stack(
                                     children: [
                                       Positioned(child: Text(mm.avd[i].id.toString())
                                       ),
                                     ],
                                   ),
                                   Stack(
                                     children: [
                                       Positioned(child: Text(mm.avd[i].ch.length.toString())
                                       ),
                                     ],
                                   ),

                                 ]
                             ),
                           ),
                         );

                     },),
                 ),],
             ),
           );

         },

       );


  }
}
