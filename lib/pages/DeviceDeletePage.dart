import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tel/serv/ProviderHelper.dart';

class DeviceDeletePage extends StatelessWidget {
  static String routeName='DeviceDeletePage';

  @override

  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Delete Device',),centerTitle: true,backgroundColor: Color(0xff0e3d7d),),
      body: Consumer<ProviderHelper>(
        builder: (context,m,w){

          return ListView.builder(itemBuilder: (context,i){
            return ListTile(
              leading: Image(image: AssetImage('images/ic2.png')),

              title: Text(m.avd[i].name.toString()),
              subtitle: Text(m.avd[i].link.toString()),
              trailing: IconButton(icon: Icon(Icons.delete),
                onPressed: ()async{
                String? s=await Provider.of<ProviderHelper>(context,listen:false).deDevice(m.avd[i]);
                if(s==null){
                  Navigator.pop(context);
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$s',style: TextStyle(color: Colors.white),),
                        backgroundColor: Color(0xff0e3d7d),
                        duration: Duration(seconds: 9),
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
