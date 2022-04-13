import 'package:flutter/material.dart';
import 'package:smart_tel/customWidgets/AppDrawer.dart';
import 'package:string_validator/string_validator.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  static String routeName='ContactUs';
  GlobalKey<ScaffoldState> skey=GlobalKey<ScaffoldState>();
  GlobalKey<FormState> fkey=GlobalKey<FormState>();
  String? n; String? e; String? m;

  launchURL() async {
    const url = 'https://www.google.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  launchEmail() async {
    launch(
        "mailto:khaledissa120@gmail.com?subject=EmailSubject&body=Write how we can help you");
  }

  makeCall()async{
    launch("tel:<+201016663555>");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: skey,
      drawer: AppDrawer(),
      appBar: AppBar(title: Text('Contact Us'),centerTitle: true,backgroundColor: Color(0xff0e3d7d),),
      body: Form(
        key: fkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              SizedBox(height: 60,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onSaved: (x){n=x;},
                  validator: (value){
                    String x= value!=null? value : '';
                    if(!isAlphanumeric(x)){return 'Name must contain only letter and numbers';}

                    else{return null;}
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',

                  ),
                ),
              ),
              SizedBox(height: 24,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onSaved: (x){e=x;},
                  validator: (value){
                    String x= value!=null? value : '';
                    if(!isEmail(x)){return 'Please enter correct email address';}

                    else{return null;}
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',

                  ),
                ),
              ),

              SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Message',
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
              ),

              SizedBox(height: 24,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                  child: TextFormField(
                    maxLines: 10,
                    onSaved: (x){
                      m=x;
                    },
                    validator: (value){
                      String x= value!=null? value : '';
                      return null;
                    },
                    decoration: InputDecoration(
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

              SizedBox(height: 20,),

              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff0e3d7d),

                  ),

                  child: TextButton(onPressed: ()async{

                    if(fkey.currentState!.validate()){
                      fkey.currentState!.save();
                      await launch("mailto:khaledissa120@gmail.com?subject=${e}&body=${m}");

                    }


                  },

                      child: Text('Send Message',style: TextStyle(
                          color: Colors.white
                      ),))),

              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Get in Touch',
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
              ),

              SizedBox(height: 20,),

              InkWell(
                onTap: (){
                  makeCall();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Icon(Icons.call),SizedBox(width: 5,), Text('+201016663555'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 6,),

              InkWell(
                onTap: (){
                  launchEmail();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Icon(Icons.email),SizedBox(width: 5,), Text('khaledissa120@gmail.com'),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 100,),

            ],
          ),
        ),
      ),
    );
  }
}
