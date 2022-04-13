import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:smart_tel/backend/BackendHelper.dart';
import 'package:smart_tel/customWidgets/Device.dart';


class DeviceControl1 extends StatefulWidget {
  static String routeName='DeviceControl1';
  Device? device;
  bool? sw;

  DeviceControl1(this.device,this.sw);
  @override
  _DeviceControl1State createState() => _DeviceControl1State();
}

class _DeviceControl1State extends State<DeviceControl1> {

  @override
  Widget build(BuildContext context) {

    return widget.sw==null?Scaffold(body: Center(child: CircularProgressIndicator())):Scaffold(
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




                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text(widget.device!.ch[0].toString()),
                  FlutterSwitch(
                    duration: Duration(milliseconds: 1000),
                    activeColor: Colors.green,
                    inactiveColor: Colors.red,
                    activeTextFontWeight: FontWeight.bold,
                    inactiveTextFontWeight: FontWeight.bold,
                    value: widget.sw!,
                    width: 100,
                    height: 54,
                    showOnOff: true,
                    onToggle: (val)async{
                      widget.sw=val;
                      await BackendHelper.backendHelper.deviceControl1(widget.device!.link.toString(),
                          {
                            "deviceid": "",
                            "data": {
                              "switch": widget.sw==true?"on":"off"
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
