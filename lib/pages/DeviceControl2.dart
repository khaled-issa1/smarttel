
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:smart_tel/backend/BackendHelper.dart';
import 'package:smart_tel/customWidgets/Device.dart';


class DeviceControl2 extends StatefulWidget {
  static String routeName='DeviceControl2';
  dDevice? device;
  bool? sw1;
  bool? sw2;


  DeviceControl2(this.device,this.sw1,this.sw2);
  @override
  _DeviceControl2State createState() => _DeviceControl2State();
}

class _DeviceControl2State extends State<DeviceControl2> {

  @override
  Widget build(BuildContext context) {

    return widget.sw2==null?const Scaffold(body: Center(child: CircularProgressIndicator())):Scaffold(
        appBar: AppBar(title: Text(widget.device!.name.toString()+' Device'),centerTitle: true,backgroundColor: const Color(0xff0e3d7d),),
        body: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 50,),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: Border.all(color: Colors.black),
                  child: Column(children: [

                    const SizedBox(height: 5,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                         Text('Name'),

                        Text('ID'),

                         Text('Company'),
                      ],


                    ),
                    const Divider(color: Colors.black,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.device!.name.toString()),

                        Text(widget.device!.id.toString()),

                        Text(widget.device!.company.toString()),
                      ],

                    ),
                    const SizedBox(height: 7,)
                  ],),),
              ),
              const SizedBox(height: 40,),




              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.device!.ch[0].toString()),
                  FlutterSwitch(
                    duration: const Duration(milliseconds: 1000),
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
                            'ch':[widget.sw1,widget.sw2]
                          }   );
                      setState(() {

                      });


                    },

                  ),
                ],),


              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.device!.ch[1].toString()),
                  FlutterSwitch(
                    duration: const Duration(milliseconds: 1000),
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
                            'ch':[widget.sw1,widget.sw2]
                          }   );
                      setState(() {

                      });


                    },

                  ),
                ],),




              const SizedBox(height: 30,),



              Container(
                  width: double.infinity,
                  height: 250,
                  child: const Image(image:  AssetImage('images/logo.png'),fit: BoxFit.fill,))
            ],


          ),
        )

    );
  }
}
