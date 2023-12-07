
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learn_api/ui/login.dart';
class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  var _email = TextEditingController();
  var _password = TextEditingController();
  var _name = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  var data;
String? email,password,name;
 void setData() async{
    try{
      var url = Uri.parse("https://premium-lychee-backendddd-production.up.railway.app/auth/signup");
      http.Response response = await http.post(url,
          headers: {"Content-Type":"application/json"},
          body: jsonEncode({
            "email":email,
            "password":password,
            "name":name
          })
      );
       data = jsonDecode(response.body);
      print(response.statusCode);

      if(response.statusCode >= 200 && response.statusCode < 300) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));


      }else{
        print(data);
        // data.forEach((key, value) {value;});

        Get.snackbar("${ data['errors']['email']}", " ",snackPosition: SnackPosition.BOTTOM);

      }


    }catch(e){
      print(e);

    }


 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sing up"),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _name,
                validator: (value){
                  if(value!.length <= 1 || value.length>=16 ){
                    return "Username Must Be Between 2 to 15 chars";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Name"
                ),
              ),
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
                if(_formKey.currentState!.validate()){
                  email = _email.text;
                  password= _password.text;
                  name = _name.text;
                  setData();

                }

              }, child: Text("Sing up"))

            ],
          ),
        ),
      ),
    );
  }
}
