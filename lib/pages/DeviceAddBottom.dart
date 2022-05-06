import 'package:arp_scanner/arp_scanner.dart';
import 'package:arp_scanner/device.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tel/customWidgets/Device.dart';
import 'package:smart_tel/pages/HomePage.dart';
import 'package:smart_tel/serv/NavService.dart';
import 'package:smart_tel/serv/ProviderHelper.dart';

class DeviceAddBottom extends StatefulWidget {
  @override
  State<DeviceAddBottom> createState() => _DeviceAddBottomState();
}

class _DeviceAddBottomState extends State<DeviceAddBottom> {
  int? v=1;
  GlobalKey<FormState> fkey=GlobalKey<FormState>();
  dDevice device1=dDevice(ch: [] , id: '');

  Set<String> ma={};
  Set<String> vend= {};

  deviceScan(){
    ma={};
    vend={};
    ArpScanner.onScanning.listen((Device device) {
      ma.add('${device.mac}');
      vend.add('${device.vendor}');
    });
    ArpScanner.onScanFinished.listen((List<Device> devices) {
      showDialog(context: context , builder: (BuildContext context){
        return  AlertDialog(
          backgroundColor: const Color(0xff0e3d7d),
          scrollable: true,
          content:Container(
            height: 200.0,
            width: 400.0,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: vend.length  ,
              itemBuilder: (context,i){
                return InkWell(
                  onTap: (){
                    device1.id= ma.elementAt(i).toUpperCase();
                    device1.link='https://smart-tel-482a5-default-rtdb.firebaseio.com/control/${ma.elementAt(i)}';
                    Navigator.pop(context);
                    ArpScanner.cancel();
                  },
                  child: Card(

                    child: Column(children: [
                      Text(ma.elementAt(i)),
                      Text(vend.elementAt(i)),

                    ],),
                  ),
                );},

              separatorBuilder: (context,e){
                return const SizedBox(height: 20,);
              },

            ),
          ),


        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    device1.id='';
    return Scaffold(


      body: Form(
        key: fkey,
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 45,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  style:const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.white),
                    labelText: 'Device Name',
                    filled: true,
                    fillColor: const Color(0xff0e3d7d),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),

                  ),

                  onSaved: (value){
                    device1.name=value;
                  },
                  validator: (value){
                    String a= value==null?'':value;
                    if(a.isEmpty){return 'Please Enter name for your device';}
                    else{return null;}
                  },

                ),

              ),

              const SizedBox(height: 45,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  style:const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.white),
                    labelText: 'Device Company',
                    filled: true,
                    fillColor: const Color(0xff0e3d7d),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
                  onSaved: (value){
                    device1.company=value;
                  },
                  validator: (value){
                    String a= value==null?'':value;
                    if(a.isEmpty){return 'Please Enter your device company';}
                    else{return null;}
                  },

                ),

              ),

              const SizedBox(height: 45,),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),

                  width: double.infinity,
                  height: 58,
                  child: TextButton(onPressed: ()async{
                    await ArpScanner.scan();
                    deviceScan();


                  }, child: const Text('Scan on device mac address',style: const TextStyle(color: Color(0xff0e3d7d), fontWeight: FontWeight.w700,fontSize: 17),)),
                ),
              ),


              const SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    children: [
                      const Text('Device Channels Number'),
                      const SizedBox(width: 20,),
                      DropdownButton(
                          iconEnabledColor: Colors.blue,
                          value: v,
                          items: const [
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
                        style:const TextStyle(color: Colors.white,fontSize: 10),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white,fontSize: 10),
                          hintText: 'ch1 Name',
                          filled: true,
                          fillColor: const Color(0xff0e3d7d),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
                        onSaved: (value){
                          device1.ch.add(value);
                        },
                        validator: (value){
                          String a= value==null?'':value;
                          if(a.isEmpty){return 'Erorr';}
                          else{return null;}
                        },

                      ),):const Text(''),
                      const SizedBox(width: 5,),
                      v!>=2?Container(width:85,height:60,child: TextFormField(
                        style:const TextStyle(color: Colors.white,fontSize: 10),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white,fontSize: 10),
                          hintText: 'ch2 Name',
                          filled: true,
                          fillColor: const Color(0xff0e3d7d),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
                        onSaved: (value){
                          device1.ch.add(value);
                        },
                        validator: (value){
                          String a= value==null?'':value;
                          if(a.isEmpty){return 'Error';}
                          else{return null;}
                        },

                      ),):const Text(''),
                      const SizedBox(width: 5,),
                      v!>=3?Container(width:85,height:60,child: TextFormField(
                        style:const TextStyle(color: Colors.white,fontSize: 10),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white,fontSize: 10),
                          hintText: 'ch3 Name',
                          filled: true,
                          fillColor: const Color(0xff0e3d7d),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
                        onSaved: (value){
                          device1.ch.add(value);
                        },
                        validator: (value){
                          String a= value==null?'':value;
                          if(a.isEmpty){return 'Error';}
                          else{return null;}
                        },

                      ),):const Text(''),

                    ]
                ),


              ),

              const SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xff0e3d7d),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: TextButton(
                    onPressed: ()async{
                      if(fkey.currentState!.validate() && device1.id!.length>=12) {
                        device1.link='https://smart-tel-482a5-default-rtdb.firebaseio.com/control/${device1.id}';
                        fkey.currentState!.save();

                        String? errorData=await Provider.of<ProviderHelper>(context,listen: false).adDevice(device1);

                        if(errorData==null){
                          NavServices.navServices.NavRep(HomePage.routeName);
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('$errorData',style: const TextStyle(color: Colors.white),),
                                backgroundColor: const Color(0xff0e3d7d),
                                duration: const Duration(seconds: 9),
                              ));
                        }
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please Enter Mac address and other details for your device',style:  TextStyle(color: Colors.white),),
                              backgroundColor:  Color(0xff0e3d7d),
                              duration:  Duration(seconds: 9),
                            ));
                      }


                    },
                    child: const Text('Save',style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),),
              ),
              const SizedBox(height: 50,)




            ],
          ),
        ),
      )

      ,
    );
  }
}

