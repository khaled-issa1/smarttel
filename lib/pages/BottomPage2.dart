import 'package:flutter/material.dart';
import 'package:smart_tel/backend/BackendHelper.dart';

class BottomPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          const SizedBox(height: 100,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Container(
              width: double.infinity,
              height: 365,

              child:
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.grey,

                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),

                      child: Container(
                        width: 100,height: 100,
                        color: Colors.orange,
                          child: Center(child: Text(BackendHelper.backendHelper.userData()[0].toString().substring(0,2),
                            style: const TextStyle(color: Color(0xff0e3d7d),fontSize: 20,fontWeight: FontWeight.w800),
                          ),

                          )),
                    ),
                    const SizedBox(height: 20,),
                    Text(BackendHelper.backendHelper.userData()[0],
                      style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w800),),
                    const SizedBox(height: 60,),

                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: const Color(0xff0e3d7d),width: 3),
                          color: Colors.white
                      ),
                      child: TextButton(onPressed: ()async{
                        String? s=await BackendHelper.backendHelper.logout();
                        if(s != null){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$s'),
                            duration: const Duration(seconds:30 ),));
                        }
                      },
                        child:const Text('Sign out',
                          style: const TextStyle(fontWeight: FontWeight.w500,color: Color(0xff0e3d7d)),), ),
                    ),
                    const SizedBox(height: 20,)
                  ],
                ),
              )

              ,),
          ),


        ],
      ),
    );
  }
}
