import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'BottomPage1.dart';
import 'package:smart_tel/customWidgets/AppDrawer.dart';


class HomePage extends StatelessWidget {
  static String routeName='HomePage';
  GlobalKey<ScaffoldState> gsk=  GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: gsk,
      bottomNavigationBar: BottomAppBar(
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            IconButton(onPressed: (){
              gsk.currentState!.openDrawer();

            }, icon: Icon(Icons.menu),color: Color(0xff0e3d7d) ,),


            IconButton(
                icon: Icon(
                  Icons.home,
                  color: Color(0xff0e3d7d) ,
                ),
                onPressed: () {

                }),





            IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Color(0xff0e3d7d) ,
                ),
                onPressed: () {
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
                }),
          ],
        ),
      ),
      drawer: AppDrawer(),

      appBar: AppBar(backgroundColor: Color(0xff0e3d7d),title: Text('Smart Tel'),centerTitle: true,),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),

        onPageChanged: (index) {},
        children: [
          BottomPage1(),

        ],
      ),
    );
  }
}
