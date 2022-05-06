import 'package:dio/dio.dart';
import 'package:smart_tel/customWidgets/Device.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_tel/pages/LoginPage.dart';
import 'package:smart_tel/serv/NavService.dart';
import 'package:smart_tel/serv/SPHelper.dart';


class BackendHelper{
  BackendHelper._();
  static BackendHelper backendHelper=BackendHelper._();
  Dio dio=Dio();
  String baseUrl='https://smart-tel-482a5-default-rtdb.firebaseio.com/smart';
  String baseUrl1='https://smart-tel-482a5-default-rtdb.firebaseio.com/control';

  FirebaseAuth auth=FirebaseAuth.instance;

   Future<List<dDevice>> avDevice()async{

      Response<dynamic> a=await dio.get(baseUrl+'/${auth.currentUser?.uid}.json');
      dynamic aa= await a.data;
      if(aa==null){

        return [];

      }
      else{
        List aaa=await aa.values.toList();

        List<dDevice> bas=  aaa.map((e) => dDevice.fromJson(e) ).toList();

        return bas;
      }



  }

  addDevice(dDevice dev)async{
    try{
      List a= dev.ch.length==1?[false]:dev.ch.length==2?[false,false]:[false,false,false];

      await dio.put(baseUrl+'/${auth.currentUser?.uid}/${dev.id}.json',
        data: dev.toMap(dev),);
      await dio.put('${dev.link}.json',
      data: {'ch': a }
      );
      return null;
    }catch(e){
      return e.toString().substring(0,200);

    }

  }

  delDevice(dDevice dev)async{
    try{
      await dio.delete(baseUrl+'/${auth.currentUser?.uid}/${dev.id}.json',);
      await dio.delete(baseUrl1+'/${dev.id}.json');
      return null;
    }catch(e){
      return e.toString().substring(0,200);

    }

  }

  Future<List<dynamic>> deviceStatus(String deviceLink)async{
    try{
      Response<dynamic> k=await dio.get(deviceLink+'/ch.json');
      List kk= await k.data;

      return kk;
    }catch(e){

      return [false,false,false];
    }
  }



  deviceControl1(String deviceLink,Map controlData)async{

       await dio.put('$deviceLink.json',
         data: controlData
       );






  }


  Future<String?> signup(String em,String pas)async{
    try{
      await auth.createUserWithEmailAndPassword(email: em, password: pas);
      NavServices.navServices.NavRep(LoginPage.routeName);
      return null;

    }catch(e){
      return '$e';

    }

  }

  login(String em,String pas)async{
    try{
      await auth.signInWithEmailAndPassword(email: em, password: pas);
      SPHelper.spHelper.SetAuth(true);
      return null;

    }catch(e){

      return '$e';

    }

  }

  logout()async{
    try{
      await auth.signOut();
      SPHelper.spHelper.SetAuth(false);
      NavServices.navServices.NavRep(LoginPage.routeName);
      return null;

    }catch(e){

      return '$e';

    }

  }

  userData(){
     String? e=auth.currentUser?.email;
     String? u=auth.currentUser?.uid;

     return [e,u];
  }












}