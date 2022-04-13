import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_tel/customWidgets/Device.dart';
import 'package:smart_tel/serv/ProviderHelper.dart';
import 'package:string_validator/string_validator.dart';

class DeviceAddPage extends StatefulWidget {
  static String routeName='DeviceAddPage';

  @override
  State<DeviceAddPage> createState() => _DeviceAddPageState();
}

class _DeviceAddPageState extends State<DeviceAddPage> {
  Device device=Device(ch: []);


  int? v=1;

  GlobalKey<FormState> fkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new Device',),centerTitle: true,backgroundColor: Color(0xff0e3d7d),),
      backgroundColor: Colors.white70,
      body: Form(
        key: fkey,
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  style:TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Device Name',
                    filled: true,
                    fillColor: Color(0xff0e3d7d),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),

                  ),

                  onSaved: (value){
                    device.name=value;
                  },
                  validator: (value){
                    String a= value==null?'':value;
                    if(a.isEmpty){return 'Please Enter name for your device';}
                    else{return null;}
                  },

                ),

              ),
              SizedBox(height: 40,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  style:TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Device ID',
                    filled: true,
                    fillColor: Color(0xff0e3d7d),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
                  onSaved: (value){
                    device.id=value;
                  },
                  validator: (value){
                    String a= value==null?'':value;
                    if(a.isEmpty){return 'Please Enter ID for your device';}
                    else{return null;}
                  },

                ),

              ),
              SizedBox(height: 40,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  style:TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Device link',
                    filled: true,
                    fillColor: Color(0xff0e3d7d),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
                  onSaved: (value){
                    device.link=value;
                  },
                  validator: (value){
                    String a= value==null?'':value;
                    if(a.isEmpty){return 'Please Enter link for your device';}
                    else if(!isURL(a)){return 'please Enter correct link for your device';}
                    else{return null;}
                  },

                ),

              ),
              SizedBox(height: 40,),




              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  style:TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Device Company',
                    filled: true,
                    fillColor: Color(0xff0e3d7d),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
                  onSaved: (value){
                    device.company=value;
                  },
                  validator: (value){
                    String a= value==null?'':value;
                    if(a.isEmpty){return 'Please Enter your device company';}
                    else{return null;}
                  },

                ),

              ),
              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text('Device Channels Number'),
                    SizedBox(width: 20,),
                    DropdownButton(
                      iconEnabledColor: Colors.blue,
                      value: v,
                      items: [
                        DropdownMenuItem<int>(child: Text('1'),value: 1,),
                        DropdownMenuItem<int>(child: Text('2'),value: 2,),
                        DropdownMenuItem<int>(child: Text('3'),value: 3,),
                      ], onChanged: (int? value){
                    v=value;
                    setState(() {

                    });

                  }),]
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[

                    v!>=1?Container(width:85,height: 60,child: TextFormField(
                      style:TextStyle(color: Colors.white,fontSize: 10),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white,fontSize: 10),
                        hintText: 'ch1 Name',
                        filled: true,
                        fillColor: Color(0xff0e3d7d),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
                      onSaved: (value){
                        device.ch.add(value);
                      },
                      validator: (value){
                        String a= value==null?'':value;
                        if(a.isEmpty){return 'Erorr';}
                        else{return null;}
                      },

                    ),):Text(''),
                    SizedBox(width: 5,),
                    v!>=2?Container(width:85,height:60,child: TextFormField(
                      style:TextStyle(color: Colors.white,fontSize: 10),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white,fontSize: 10),
                        hintText: 'ch2 Name',
                        filled: true,
                        fillColor: Color(0xff0e3d7d),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
                      onSaved: (value){
                        device.ch.add(value);
                      },
                      validator: (value){
                        String a= value==null?'':value;
                        if(a.isEmpty){return 'Error';}
                        else{return null;}
                      },

                    ),):Text(''),
                    SizedBox(width: 5,),
                    v!>=3?Container(width:85,height:60,child: TextFormField(
                      style:TextStyle(color: Colors.white,fontSize: 10),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white,fontSize: 10),
                        hintText: 'ch3 Name',
                        filled: true,
                        fillColor: Color(0xff0e3d7d),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
                      onSaved: (value){
                        device.ch.add(value);
                      },
                      validator: (value){
                        String a= value==null?'':value;
                        if(a.isEmpty){return 'Error';}
                        else{return null;}
                      },

                    ),):Text(''),

                  ]
                ),


              ),

              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff0e3d7d),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: TextButton(
                    onPressed: ()async{
                      if(fkey.currentState!.validate()) {
                        fkey.currentState!.save();

                        String? errorData=await Provider.of<ProviderHelper>(context,listen: false).adDevice(device);

                        if(errorData==null){
                          Navigator.pop(context);
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('$errorData',style: TextStyle(color: Colors.white),),
                                backgroundColor: Color(0xff0e3d7d),
                                duration: Duration(seconds: 9),
                              ));
                        }
                      }


                    },
                    child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),),
              ),
              SizedBox(height: 50,)




            ],
          ),
        ),
      )

      ,
    );
  }
}
