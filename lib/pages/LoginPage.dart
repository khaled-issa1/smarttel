import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tel/backend/BackendHelper.dart';
import 'package:smart_tel/pages/HomePage.dart';
import 'package:smart_tel/pages/RegisterPage.dart';
import 'package:smart_tel/serv/NavService.dart';
import 'package:smart_tel/serv/ProviderHelper.dart';
import 'package:string_validator/string_validator.dart';

class LoginPage  extends StatefulWidget {
  static String routeName='LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey=GlobalKey();
  bool inVisiblePass=true;
  String? email;
  String? password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(key: formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 250,),
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Sign in',
                    style: TextStyle(color: Color(0xff0e3d7d),fontWeight: FontWeight.w700,fontSize: 25),
                  ),
                ),

                const SizedBox(height: 50,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    width: double.infinity,height: 60,
                    child: TextFormField(
                      onSaved: (v){
                        email=v;
                      },
                      validator: (value){
                        String v= value!=null? value : '';
                        if(v.isEmpty){return 'Enter your email address';}
                        else if(!isEmail(v)){return 'please enter correct email address';}
                        else{return null;}
                      },
                      decoration:
                      InputDecoration(
                          prefixIcon:const Icon(Icons.email,color: Color(0xff0e3d7d),) ,
                          labelText: 'Email',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))


                      ),

                    ),
                  ),
                ),

                const SizedBox(height: 35,),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    width: double.infinity,height: 60,
                    child: TextFormField(
                      obscureText: inVisiblePass,
                      onSaved: (v){
                        password=v;
                      },
                      validator: (value){
                        String v= value!=null? value : '';
                        if(v.isEmpty){return 'enter password';}
                        else if(v.length<=6){return 'password must be more than 6 letter';}
                        else {return null;}
                      },
                      decoration:
                      InputDecoration(
                          prefixIcon:const Icon(Icons.lock_outlined,color:  Color(0xff0e3d7d),) ,
                          suffix: IconButton(icon: const Icon(Icons.remove_red_eye_outlined),
                            onPressed: (){
                              inVisiblePass=!inVisiblePass;
                              setState(() {

                              });
                            },),
                          labelText: 'Password',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))


                      ),

                    ),
                  ),
                ),
                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(child: const Text('don\'t have account?',
                        style: TextStyle(color: Color(0xff0e3d7d),fontWeight: FontWeight.w400,fontSize: 12),
                      ),),
                      const SizedBox(width: 10,),
                    InkWell(
                      onTap: (){NavServices.navServices.NavRep(RegisterPage.routeName);},
                        child: Container(child: const Text('create account',
                          style:  TextStyle(color: Color(0xff0e3d7d),fontWeight: FontWeight.w700,fontSize: 12),
                        ),)),
                  ],),
                ),

                const SizedBox(height: 50,),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 100,vertical: 20),
                  width:double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xff0e3d7d),width: 3),),
                  child: TextButton(onPressed: ()async{
                    if(formkey.currentState!.validate()){
                      formkey.currentState!.save();
                      String? x=await BackendHelper.backendHelper.login(email!, password!);
                      if(x==null){
                        Provider.of<ProviderHelper>(context,listen:false).avilableDevices();
                        NavServices.navServices.NavRep(HomePage.routeName);
                      }
                      if(x!=null){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(x),
                          duration: const Duration(seconds:30 ),));
                      }

                    }


                  }, child: const Text('Login',style:  TextStyle(color:Color(0xff0e3d7d),fontSize: 22,fontWeight: FontWeight.bold),),
                  ),
                ),



              ],
            ),
          )),
    );
  }
}
