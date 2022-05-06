import 'package:flutter/material.dart';
import 'package:smart_tel/customWidgets/AppDrawer.dart';
import 'package:string_validator/string_validator.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  static String routeName='ContactUs';
  GlobalKey<ScaffoldState> skey=GlobalKey<ScaffoldState>();
  GlobalKey<FormState> fkey=GlobalKey<FormState>();
  String? n; String? e; String? m='';


  _contactus(String sub, String mess) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: 'ia44333@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': sub ,
        'body': mess
      }),
    );
    await launchUrl(launchUri);


  }


    _makecall() async {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: '+201016663555',
      );
      await launchUrl(launchUri);
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: skey,
      drawer: AppDrawer(),
      appBar: AppBar(title: const Text('Contact Us'),centerTitle: true,backgroundColor: const Color(0xff0e3d7d),),
      body: Form(
        key: fkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              const SizedBox(height: 60,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onSaved: (x){n=x;},
                  validator: (value){
                    String x= value!=null? value : '';
                    if(!isAlphanumeric(x)){return 'Name must contain only letter and numbers';}

                    else{return null;}
                  },
                  decoration: const InputDecoration(
                    labelText: 'Subject',
                  ),
                ),
              ),
              const SizedBox(height: 24,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onSaved: (x){e=x;},
                  validator: (value){
                    String x= value!=null? value : '';
                    if(!isEmail(x)){return 'Please enter correct email address';}

                    else{return null;}
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',

                  ),
                ),
              ),

              const SizedBox(height: 24,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Message',
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
              ),

              const SizedBox(height: 24,),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                  child: TextFormField(
                    maxLines: 10,
                    onSaved: (x){
                      m=x;
                    },
                    validator: (value){
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Type Here',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,

                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff0e3d7d),

                  ),

                  child: TextButton(onPressed: ()async{

                    if(fkey.currentState!.validate()){
                      fkey.currentState!.save();
                      await _contactus('$n', '$m');

                    }


                  },

                      child: const Text('Send Message',style:  TextStyle(
                          color: Colors.white
                      ),))),

              const SizedBox(height: 30,),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Get in Touch',
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
              ),

              const SizedBox(height: 20,),

              InkWell(
                onTap: (){
                  _makecall();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: const [
                       Icon(Icons.call), SizedBox(width: 5,),  Text('+201016663555'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6,),

              InkWell(
                onTap: (){
                  _contactus('subject','Type your message here');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: const [
                       Icon(Icons.email), SizedBox(width: 5,),  Text('ia44333@gmail.com'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 100,),

            ],
          ),
        ),
      ),
    );
  }
}
