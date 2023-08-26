import 'package:flutter/material.dart';
import 'package:task3_project/screens/login_screen.dart';

import '../snackbar/custom_snackbar.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id="one";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obsecure=false;
  String? password;
  String ?selected;

  List <String>Items=[
    "Male",
    "Female",
  ];
  String? selectedItem;
  List <String>Items2=[
    "Auc",
    "Helwan",
    "Cairo"
  ];
  String? selectedItem2;
  List <String>Items3=[
    "Grade1",
    "Grade2",
  ];

  TextEditingController emailController=TextEditingController();
  TextEditingController paasswordController=TextEditingController();
  TextEditingController paasswordConfirmationController=TextEditingController();
  TextEditingController phoneController=TextEditingController();

  GlobalKey<FormState>formKey=GlobalKey<FormState>();
  @override
  void initState() {
    selected=Items[0];
    selectedItem=Items2[0];
    selectedItem2=Items3[0];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
          child: Form(
          key: formKey,
          child: Column(
          children: [
                Text("Register ",style:TextStyle(color:Colors.black,fontSize:40 ,fontWeight:FontWeight.bold)),
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
               SizedBox(height: 6),

                TextFormField(
                  onTapOutside: (value){
                    FocusScope.of(context).requestFocus(FocusNode());//دي بتخلي انك اول ما تدوس بره الكيبيورد ف الكيبورد يقفل
                  },
                  controller: paasswordController,
                  keyboardType: TextInputType.number,
               //   maxLength: 8,
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
                    else password=value;
                  },

                ),

            TextFormField(
              onTapOutside: (value){
                FocusScope.of(context).requestFocus(FocusNode());//دي بتخلي انك اول ما تدوس بره الكيبيورد ف الكيبورد يقفل
              },
              controller: paasswordConfirmationController,
              keyboardType: TextInputType.number,
         //     maxLength: 8,
              obscureText: obsecure,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              readOnly: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: "Confirm Password",
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
                if((value!.isEmpty)||(value!=(password)))

                  return "Enter your password Correctly";
                else
                  return null;
              },
            ),

            TextFormField(
              onTapOutside: (value){
                FocusScope.of(context).requestFocus(FocusNode());//دي بتخلي انك اول ما تدوس بره الكيبيورد ف الكيبورد يقفل
              },
              controller: phoneController,
              keyboardType: TextInputType.number,
              maxLength: 15,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              readOnly: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: "Phone",
                prefixIcon: Icon(Icons.phone),
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
                if(value!.isEmpty){
                  return "Required";
                }
                return null;
              },
            /*  validator:(value){
                if(value!.contains("@")&&(value!.contains(".com"))&&value!.length<20&&(value!.length>18))
                  return null;
                else

                  return "Invalid email ";
              },*/
            ),




            Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
Column(
  children: [
                  Text("Gender",style:TextStyle(color:Colors.black,fontSize:20 ,fontWeight:FontWeight.bold)),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange)
                    ),

                    child: DropdownButton<String>(items: Items.map((e)=>DropdownMenuItem(child: Text(e),value:e,)).toList()
                      , onChanged: (value){setState(() {

                        selected=value as String;
                      });},
                      value: selected,),
                  ),


]
),
               //   SizedBox(width: 20),
                  Column(
                    children: [
                      Text("University",style:TextStyle(color:Colors.black,fontSize:20 ,fontWeight:FontWeight.bold)),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.orange)
                      ),
                        child: DropdownButton<String>(items: Items2.map((e)=>DropdownMenuItem(child: Text(e),value:e,)).toList()
                          , onChanged: (value){setState(() {
                            selectedItem=value as String;
                          });},

                          value: selectedItem,),
                      ),
  ],

              ),

              ],

            ),



            Text("Grade",style:TextStyle(color:Colors.black,fontSize:20 ,fontWeight:FontWeight.bold)),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orange)
              ),
              child: DropdownButton<String>(items: Items3.map((e)=>DropdownMenuItem(child: Text(e),value:e,)).toList()
                , onChanged: (value){setState(() {
                  selectedItem2=value as String;
                });},
                value: selectedItem2,),
            ),


            ElevatedButton(

              child: Text("Register"),
              onPressed:(){
              if(formKey.currentState!.validate()&&selected!=null&&selectedItem!=null&&selectedItem2!=null)
                //  print("hello");
                Navigator.of(context).pushNamed(LoginScreen.id);
              else
                CustomSnackBar.show(context:context,content:"Please fill all fields");
            },
            ),
       /*    ElevatedButton(
              child: Text("Register"),
              onPressed: (){
                Navigator.of(context).pushNamed(LoginScreen.id);

              },
            ),*/
            ElevatedButton(
              child: Text("Have an account?Log in"),
              onPressed: (){
                Navigator.of(context).pushNamed(LoginScreen.id);

              },
            ),
          ],
              ),









    ),







              ),
        )


    );
  }
}
/*     Text("Gender",style:TextStyle(color:Colors.black,fontSize:20 ,fontWeight:FontWeight.bold)),
      DropdownButton<String>(items: Items2.map((e)=>DropdownMenuItem(child: Text(e),value:e,)).toList()
        , onChanged: (value){setState(() {
          selectedItem=value as String;
        });},
        value: selectedItem,),*/
/*     Text("Gender",style:TextStyle(color:Colors.black,fontSize:20 ,fontWeight:FontWeight.bold)),
        DropdownButton<String>(items: Items.map((e)=>DropdownMenuItem(child: Text(e),value:e,)).toList()
        , onChanged: (value){setState(() {
        selected=value as String;
        });},
        value: selected,),*/
