import 'package:flutter/material.dart';
import 'package:task3_project/screens/login_screen.dart';

import '../snackbar/custom_snackbar.dart';


class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});
  static String id="four";

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  bool obsecure=false;
  TextEditingController emailController=TextEditingController();


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
                      /*ElevatedButton(
                        child: Text("New User Go To Register"),
                        onPressed: (){
                          Navigator.of(context).pushNamed(RegisterScreen.id);

                        },
                      ),*/
                      Text("Reset Password",style:TextStyle(color:Colors.black,fontSize:20 ,fontWeight:FontWeight.bold)),
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


                      ElevatedButton(onPressed:(){
                        if(formKey.currentState!.validate())
                          Navigator.of(context).pushNamed(LoginScreen.id);

                        else
                          CustomSnackBar.show(context:context,content:"Wrong Email");
                      }, child: Text("Submit"),
                      ),



                    ],


                  )
              )
          ),
        )
    );
  }
}
