import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:learn_api/home_page.dart';
import 'package:learn_api/ui/Singup.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _email = TextEditingController();
  var _password = TextEditingController();
  var _loginFormKey = GlobalKey<FormState>();
  String? email , password;
  var storage = GetStorage();
  // http.Response? response;
  void setData() async{

   try{
     var url = Uri.parse("https://premium-lychee-backendddd-production.up.railway.app/auth/login");
     http.Response   response = await http.post(url,
         headers: {"Content-Type":"application/json"},
         body: jsonEncode({
           "email":email,
           "password":password,
         })
     );
     var responseData = jsonDecode(response.body);

     if(response.statusCode >= 200 && response.statusCode < 300) {
       storage.write('token',  responseData['token']);
       // isLogin.$ = true;
       // isLogin.save();
       // token.save();
       Get.snackbar(
           " Log in Successfully",
           " ",
           snackPosition: SnackPosition.BOTTOM
       );
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()),(route)=>false);
     }
     else{
       print(responseData);
       Get.snackbar("${responseData['message']}", " ",snackPosition: SnackPosition.BOTTOM);

       setState(() {

       });
     }
   }catch(e){
     print(e);
   }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _loginFormKey,
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text(" Login",style: TextStyle(fontSize: 30),),
        TextFormField(
          controller: _email,
          validator: (value){
            bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
            if(emailValid == false){
              return "Please Provide a valid Email";
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: "Email"
          ),
        ),
        TextFormField(
          controller: _password,
          validator: (value){
            if(value!.length <= 5){
              return "Your Password Must Be Greater Than 6 chars";
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: "Password"
          ),
        ),
            ElevatedButton(onPressed: (){
                if(_loginFormKey.currentState!.validate()){
                  // if(response != null){
                  email = _email.text;
                  password = _password.text;
                  setData();
                  // }else{
                  //   CircularProgressIndicator();
                  // }

                }


            }, child: const Text("Log in")),
            OutlinedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SingUp())), child: Text("sing up"))

          ],
        ),
      ),
    );
  }
}
