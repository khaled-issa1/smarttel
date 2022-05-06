import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_tel/pages/BottomPage2.dart';
import 'package:smart_tel/pages/DeviceAddBottom.dart';
import 'BottomPage1.dart';
import 'package:smart_tel/customWidgets/AppDrawer.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';


class HomePage extends StatelessWidget {
  static String routeName='HomePage';
  GlobalKey<ScaffoldState> gsk=  GlobalKey<ScaffoldState>();
  PageController pageController=PageController(initialPage: 1);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: gsk,

      bottomNavigationBar: ConvexAppBar(
        backgroundColor:  const Color(0xff0e3d7d),

        items: const [
          TabItem(icon: Icons.menu, title: 'Menu'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.home_outlined, title: 'Home'),
          TabItem(icon: Icons.person, title: 'Profile'),
          TabItem(icon: Icons.exit_to_app, title: 'Exit'),
        ],
        initialActiveIndex: 2,

        onTap: (i){
          if(i==0){gsk.currentState!.openDrawer();}
          else if(i==1){pageController.jumpToPage(0);}
          else if(i==2){pageController.jumpToPage(1);}
          else if(i==3){pageController.jumpToPage(2);}
          else if(i==4){
            showDialog(context: context, builder: (context){
              return  AlertDialog(
                content: const Text(" Are you sure you want to close app",style: TextStyle(color:  Color(0xff0e3d7d),fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                actions: [
                  TextButton(
                    child: const Text("No",style:  TextStyle(color: Color(0xff0e3d7d),fontSize: 15,fontWeight: FontWeight.bold),),
                    onPressed:  () {
                      Navigator.pop(context);
                    },
                  ),

                  TextButton(
                    child: const Text("yes",style:  TextStyle(color: Color(0xff0e3d7d),fontSize: 15,fontWeight: FontWeight.bold),),
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
          }


        },
      ),


      drawer: AppDrawer(),

      appBar: AppBar(backgroundColor: const Color(0xff0e3d7d),title: const Text('Smart Tel'),centerTitle: true,),
      body: PageView(
        controller: pageController,

        physics: const NeverScrollableScrollPhysics(),

        onPageChanged: (index) {


        },
        children: [
          DeviceAddBottom(),
          BottomPage1(),
          BottomPage2(),

        ],
      ),
    );
  }
}
