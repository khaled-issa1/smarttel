import 'package:flutter/material.dart';
import 'package:smart_tel/backend/BackendHelper.dart';
import 'package:smart_tel/customWidgets/Device.dart';

class ProviderHelper extends ChangeNotifier{

  List<dDevice> avd=[];


   avilableDevices()async{
    avd=await BackendHelper.backendHelper.avDevice();
    notifyListeners();
  }

  adDevice(dDevice dv)async{
    String? x;
    x=await BackendHelper.backendHelper.addDevice(dv);
    avilableDevices();
    return x;
  }

  Future<String?> deDevice(dDevice d)async{
    String? x;
    x=await BackendHelper.backendHelper.delDevice(d);
    avilableDevices();
    return x;

  }

}