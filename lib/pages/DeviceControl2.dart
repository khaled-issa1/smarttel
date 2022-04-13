import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:smart_tel/backend/BackendHelper.dart';
import 'package:smart_tel/customWidgets/Device.dart';


class DeviceControl2 extends StatefulWidget {
  static String routeName='DeviceControl2';
  Device? device;
  bool? sw1;
  bool? sw2;


  DeviceControl2(this.device,this.sw1,this.sw2);
  @override
  _DeviceControl2State createState() => _DeviceControl2State();
}

class _DeviceControl2State extends State<DeviceControl2> {

  @override
  Widget build(BuildContext context) {

    return widget.sw2==null?Scaffold(body: Center(child: CircularProgressIndicator())):Scaffold(
        appBar: AppBar(title: Text(widget.device!.name.toString()+' Device'),centerTitle: true,backgroundColor: Color(0xff0e3d7d),),
        body: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 50,),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: Border.all(color: Colors.black),
                  child: Column(children: [

                    SizedBox(height: 5,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Name'),

                        Text('ID'),

                        Text('Company'),
                      ],


                    ),
                    Divider(color: Colors.black,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.device!.name.toString()),

                        Text(widget.device!.id.toString()),

                        Text(widget.device!.company.toString()),
                      ],

                    ),
                    SizedBox(height: 7,)
                  ],),),
              ),
              SizedBox(height: 40,),




              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.device!.ch[0].toString()),
                  FlutterSwitch(
                    duration: Duration(milliseconds: 1000),
                    activeColor: Colors.green,
                    inactiveColor: Colors.red,
                    activeTextFontWeight: FontWeight.bold,
                    inactiveTextFontWeight: FontWeight.bold,
                    value: widget.sw1!,
                    width: 100,
                    height: 54,
                    showOnOff: true,
                    onToggle: (val)async{
                      widget.sw1=val;
                      await BackendHelper.backendHelper.deviceControl1(widget.device!.link.toString(),
                          {
                            "deviceid": widget.device!.id,
                            "data": {
                              "switches": [
                                {"switch": widget.sw1==true?"on":"off","outlet":1},
                                {"switch": widget.sw2==true?"on":"off","outlet":2},]
                            }
                          }   );
                      setState(() {

                      });


                    },

                  ),
                ],),


              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.device!.ch[1].toString()),
                  FlutterSwitch(
                    duration: Duration(milliseconds: 1000),
                    activeColor: Colors.green,
                    inactiveColor: Colors.red,
                    activeTextFontWeight: FontWeight.bold,
                    inactiveTextFontWeight: FontWeight.bold,
                    value: widget.sw2!,
                    width: 100,
                    height: 54,
                    showOnOff: true,
                    onToggle: (val)async{
                      widget.sw2=val;
                      await BackendHelper.backendHelper.deviceControl1(widget.device!.link.toString(),
                          {
                            "deviceid": widget.device!.id,
                            "data": {
                              "switches": [
                                {"switch": widget.sw1==true?"on":"off","outlet":1},
                                {"switch": widget.sw2==true?"on":"off","outlet":2},
                                ]
                            }
                          }   );
                      setState(() {

                      });


                    },

                  ),
                ],),




              SizedBox(height: 30,),



              Container(
                  width: double.infinity,
                  height: 250,
                  child: Image(image: AssetImage('images/logo.png'),fit: BoxFit.fill,))
            ],


          ),
        )

    );
  }
}
