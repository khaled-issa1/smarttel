import 'package:flutter/material.dart';
import 'package:smart_tel/backend/BackendHelper.dart';
import 'package:smart_tel/pages/LoginPage.dart';
import 'package:smart_tel/serv/NavService.dart';
import 'package:string_validator/string_validator.dart';


class RegisterPage extends StatefulWidget {
  static String routeName='RegisterPage';


  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formkey=GlobalKey();
  String? pass1;
  String? pass2;
  bool inVisiblePass=true;
  String? email;



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Form(key: formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 130,),
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Create account',
                    style: TextStyle(color: Color(0xff0e3d7d),fontWeight: FontWeight.w700,fontSize: 25),
                  ),
                ),

                const SizedBox(height: 30,),

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
                          prefixIcon:const Icon(Icons.email,color:  Color(0xff0e3d7d),) ,
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
                        pass1=v;
                      },
                      validator: (value){
                        String x= value!=null? value : '';
                        if(x.isEmpty){return 'enter password';}
                        else if(x.length<=6){return 'password must be more than 6 letter';}
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

                const SizedBox(height: 35,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    width: double.infinity,height: 60,
                    child: TextFormField(
                      obscureText: inVisiblePass,
                      onSaved: (v){
                        pass2=v;
                      },
                      validator: (value){
                        String v= value!=null? value : '';
                        if(v.isEmpty){return 'enter password';}
                        else if(v.length<=6){return 'password must be more than 6 letter';}
                        else if(pass1!=pass2){return 'password not match';}
                        else {return null;}
                      },
                      decoration:
                      InputDecoration(
                        prefixIcon:const Icon(Icons.lock_outlined,color: Color(0xff0e3d7d),) ,
                        suffix: IconButton(icon: const Icon(Icons.remove_red_eye_outlined),
                          onPressed: (){
                            inVisiblePass=!inVisiblePass;
                            setState(() {

                            });
                          },),
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),


                      ),

                    ),
                  ),
                ),
                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(child: const Text('Already have account?',
                        style:  TextStyle(color: Color(0xff0e3d7d),fontWeight: FontWeight.w400,fontSize: 12),
                      ),),
                      const SizedBox(width: 10,),
                      InkWell(
                          onTap: (){NavServices.navServices.NavRep(LoginPage.routeName);},
                          child: Container(child: const Text('Sign in',
                            style: TextStyle(color: Color(0xff0e3d7d),fontWeight: FontWeight.w900,fontSize: 12),
                          ),)),
                    ],),
                ),

                const SizedBox(height: 70,),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  width:double.infinity,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xff0e3d7d),width: 3),

                  ),
                  child: TextButton(onPressed: ()async{
                    if(formkey.currentState!.validate()){
                      formkey.currentState!.save();

                      String? x=await BackendHelper.backendHelper.signup(email!, pass1!);
                      if(x!=null){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(x)));
                      }

                    }


                  }, child: const Text('Sign up',style: TextStyle(color:Color(0xff0e3d7d),fontSize: 22,fontWeight: FontWeight.bold),),
                  ),
                ),

                const SizedBox(height: 30,)




              ],
            ),
          )),
    );
  }
}
