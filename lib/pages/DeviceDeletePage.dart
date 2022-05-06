import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tel/serv/ProviderHelper.dart';

class DeviceDeletePage extends StatelessWidget {
  static String routeName='DeviceDeletePage';

  @override

  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text('Delete Device',),centerTitle: true,backgroundColor: const Color(0xff0e3d7d),),
      body: Consumer<ProviderHelper>(
        builder: (context,m,w){

          return ListView.builder(itemBuilder: (context,i){
            return ListTile(
              leading: const Image(image:  AssetImage('images/ic2.png')),

              title: Text(m.avd[i].name.toString()),
              subtitle: Text(m.avd[i].id.toString()),
              trailing: IconButton(icon: const Icon(Icons.delete),
                onPressed: ()async{
                String? s=await Provider.of<ProviderHelper>(context,listen:false).deDevice(m.avd[i]);
                if(s==null){
                  Navigator.pop(context);
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$s',style: const TextStyle(color: Colors.white),),
                        backgroundColor: const Color(0xff0e3d7d),
                        duration: const Duration(seconds: 9),
                      ));
                }
                },

              ),
            );


          },itemCount: m.avd.length,);
        },
      ),
    );
  }
}
