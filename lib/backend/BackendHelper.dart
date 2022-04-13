import 'package:dio/dio.dart';
import 'package:smart_tel/customWidgets/Device.dart';

class BackendHelper{

  BackendHelper._();

  static BackendHelper backendHelper=BackendHelper._();

  Dio dio=Dio();


  String baseUrl='https://smart-tel-482a5-default-rtdb.firebaseio.com/smart';

   Future<List<Device>> avDevice()async{

      Response<dynamic> a=await dio.get(baseUrl+'.json');
      dynamic aa= await a.data;
      if(aa==null){

        return [];

      }
      else{
        List aaa=await aa.values.toList();

        List<Device> aaaa= await aaa.map((e) => Device.fromJson(e) ).toList();


        return aaaa;
      }



  }

  addDevice(Device dev)async{
    try{
      await dio.put(baseUrl+'/${dev.name}.json',
        data: dev.toMap(dev),);
      return null;
    }catch(e){
      return e.toString().substring(0,200);

    }

  }

  delDevice(Device dev)async{
    try{
      await dio.delete(baseUrl+'/${dev.name}.json',);
      return null;
    }catch(e){
      return e.toString().substring(0,200);

    }

  }

  Future<bool> deviceStatus(String deviceLink)async{
    try{
      Response<dynamic> a=await dio.post(deviceLink+'zeroconf/info');
      dynamic aa= await a.data;
      print(aa);
      // bool x= aa=='true'?true:false;
      return false;
    }catch(e){
      return false;
    }
  }

  Future<List<bool>> deviceStatus2(String deviceLink)async{
    try{
      Response<dynamic> a=await dio.post(deviceLink+'zeroconf/info');
      dynamic aa= await a.data;
      print(aa);
      //List<bool> aaa=aa.map((e) => e['switch']=="on"?true:false ).toList();
      return [false,false,false];
    }catch(e){
      return [false,false,false];
    }
  }


  deviceControl1(String deviceLink,Map controlData)async{
     try{
       await dio.post(deviceLink+'zeroconf/switch',
         data: controlData
       );


     }
     catch(e){
       print(e.toString());

     }

  }








}