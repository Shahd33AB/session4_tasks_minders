

import 'package:flutter/material.dart';
import 'package:task3_project/screens/forget_screen.dart';
import 'package:task3_project/screens/home_screen.dart';
import 'package:task3_project/screens/register_screen.dart';

import '../snackbar/custom_snackbar.dart';


class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});
  static String id="two";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obsecure=false;

   TextEditingController emailController=TextEditingController();
   TextEditingController paasswordController=TextEditingController();

  GlobalKey<FormState>formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                  children: [
               ElevatedButton(
            child: Text("New User Go To Register"),
            onPressed: (){
             Navigator.of(context).pushNamed(RegisterScreen.id);

            },
          ),
                   Text("Login Page",style:TextStyle(color:Colors.black,fontSize:40 ,fontWeight:FontWeight.bold)),
                    TextFormField(
                      onTapOutside: (value){
                        FocusScope.of(context).requestFocus(FocusNode());//دي بتخلي انك اول ما تدوس بره الكيبيورد ف الكيبورد يقفل
                      },
                      controller: emailController,
                       keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      readOnly: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        labelText: "Email",
                      //  prefixIcon: Icon(Icons.verified_user),
                      ),
                      onChanged: (value){
                        print(value);
                      },
                      onEditingComplete: (){
                        print("on editing complete");
                      },
                      onFieldSubmitted: (value){
                        print(value);
                      },
                      validator:(value){
                        if((value!.contains("@gmail.com")||(value!.contains("@yahoo.com")))&&value!.length<20&&(value!.length>18))
                          return null;
                        else

                          return "Invalid email ";
                      },

                    ),
                    SizedBox(height: 15),

                    TextFormField(
                      onTapOutside: (value){
                        FocusScope.of(context).requestFocus(FocusNode());//دي بتخلي انك اول ما تدوس بره الكيبيورد ف الكيبورد يقفل
                      },
                      controller: paasswordController,
                      keyboardType: TextInputType.number,
                  //      maxLength: 8,
                      obscureText: obsecure,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      readOnly: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        labelText: "Password",
                         prefixIcon: Icon(Icons.verified_user),
                          suffixIcon: IconButton(icon:Icon(Icons.remove_red_eye_rounded),
                            onPressed: (){
                              setState(() {
                                obsecure=!obsecure;
                              });

                            },
                          ),
                      ),
                      onChanged: (value){
                        print(value);
                      },
                      onEditingComplete: (){
                        print("on editing complete");
                      },
                      onFieldSubmitted: (value){
                        print(value);
                      },

                      validator:(value){
                        if(value!.length<8){
                          return "Password length must be >= 8 ";
                        }
                        return null;
                      },

                    ),

                    /*    ElevatedButton(onPressed:(){
                  if(formKey.currentState!.validate())
             print("hello");

                  else
                    print("not validate");
                }, child: Text("validate"),
                ),*/

                    ElevatedButton(
                      child: Text("Login"),
                      onPressed: (){
                   //     Navigator.of(context).pushNamed(HomeScreen.id);
                        if(formKey.currentState!.validate())
                          Navigator.of(context).pushNamed(HomeScreen.id);

                        else
                        //   ScaffoldMessengerState.showSnackBar(
                          CustomSnackBar.show(context:context,content:"Error with Email or Password");

                          //  child: Text("show snackbar"),
                       //     onPressed: (){ScaffoldMessenger.of(context).showSnackBar(
                           //     SnackBar(content: Text(passwordController.text))
                         // );
                          //  },

                      },

                    ),

                    ElevatedButton(
                      child: Text("Forget Password?"),
                      onPressed: (){
                        Navigator.of(context).pushNamed(ForgetScreen.id);

                      },
                    ),
                  ],


          )
    )
          ),
        )
    );
  }
}
