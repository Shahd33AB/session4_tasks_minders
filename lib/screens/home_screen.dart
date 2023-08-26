import 'package:flutter/material.dart';
import 'package:task3_project/screens/register_screen.dart';

import '../snackbar/custom_snackbar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id="three";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedRadio;
  int? selectRadio;
  int Grade=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        ),
        body: Center(

            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image:AssetImage("assets/quiz time.jpg"),
                    fit:BoxFit.cover,
              ),
              ),
              child: Column(


                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //  Image.asset("assets/quiz time.jpg"),

              Container(
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white60) ,
         child:Column(

               crossAxisAlignment: CrossAxisAlignment.start,
         children:[
         SizedBox(width: 50 ),
         Text("Q1.SDK represents______",style:TextStyle(color:Colors.black,fontSize:20 ,fontWeight:FontWeight.bold)),

              RadioListTile(value: 0,
                groupValue: selectedRadio,
                onChanged: (value){
                  setState(() {

                    selectedRadio=value;
                  });
                },
                title: Text("Software Data Kit"),

              ),
                  RadioListTile(value: 1,
                    groupValue: selectedRadio,
                    onChanged: (value){
                      setState(() {
                        selectedRadio=value;
                      });
                    },
                    title: Text("Software Database Kit"),
                  ),
                  RadioListTile(value: 2,
                    groupValue: selectedRadio,
                    onChanged: (value){
                      setState(() {
                        selectedRadio=value;
                      });
                    },
                    title: Text("Software Development Kit"),
                  ),



              ]
         )
        ),
                  SizedBox(height: 25),


                  Container(
                      decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white60) ,
                      child:Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            SizedBox(width: 50 ),
                            Text("Q2.What are the advantages of Flutter?",style:TextStyle(color:Colors.black,fontSize:20 ,fontWeight:FontWeight.bold)),

                            RadioListTile(value: 0,
                              groupValue: selectRadio,
                              onChanged: (value){
                                setState(() {
                                  selectRadio=value;
                                });
                              },
                              title: Text("Cross-platform Development"),
                            ),
                            RadioListTile(value: 1,
                              groupValue: selectRadio,
                              onChanged: (value){
                                setState(() {
                                  selectRadio=value;
                                });
                              },
                              title: Text("Faster Development"),
                            ),
                            RadioListTile(value: 2,
                              groupValue: selectRadio,
                              onChanged: (value){
                                setState(() {
                                  selectRadio=value;
                                });
                              },
                              title: Text("UI Focused"),
                            ),
                            RadioListTile(value: 3,
                              groupValue: selectRadio,
                              onChanged: (value){
                                setState(() {
                                  selectRadio=value;
                                });
                              },
                              title: Text("All of the above"),
                            ),

                            /*ElevatedButton(
                              child: Text("show snackbar"),
                              onPressed: (){ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(Grade.text)),
                              );
                              },
                            ),*/
                          ]
                      )
                  ),



                  Center(

                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                      ),
                      child: Text("Submit"),
                      onPressed: (){if(
                      selectedRadio!=-1&&selectRadio!=-1){
                          if (selectedRadio==2)
                           Grade=Grade+1;

                        //  CustomSnackBar.show(context:context,content:"Your grade is $Grade/2");
                        if(selectRadio==3)
                          Grade=Grade+1;
                          CustomSnackBar.show(context:context,content:"Your grade is $Grade/2");
                          Grade=0;}
                        else
                        (
                            CustomSnackBar.show(context:context,content:"Please answer all questions")
                        );

                      },

                    ),

                  ),

                  Center(
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                      ),
                      child: Text("Reset"),
                      onPressed: (){setState(() {
                        selectRadio=-1;
                        selectedRadio=-1;
                      });


                      },

                    ),
                  ),
                ]
          ),

            ),


        )

    );
  }
}
