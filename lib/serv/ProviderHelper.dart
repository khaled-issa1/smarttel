import 'package:flutter/material.dart';
import 'package:smart_tel/backend/BackendHelper.dart';
import 'package:smart_tel/customWidgets/Device.dart';

class ProviderHelper extends ChangeNotifier{

  List<Device> avd=[];


   avilableDevices()async{
    avd=await BackendHelper.backendHelper.avDevice();
    notifyListeners();
  }

  adDevice(Device dv)async{
    String? x;
    x=await BackendHelper.backendHelper.addDevice(dv);
    avilableDevices();
    return x;
  }

  Future<String?> deDevice(Device d)async{
    String? x;
    x=await BackendHelper.backendHelper.delDevice(d);
    avilableDevices();
    return x;

  }

}