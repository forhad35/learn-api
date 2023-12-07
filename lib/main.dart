import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:learn_api/home_page.dart';
import 'package:learn_api/ui/login.dart';


void main()async {
  await GetStorage.init();
  runApp(const  MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:tokenCheck(),
    );
  }
  Widget tokenCheck(){
    var store = GetStorage();
    try{
      bool hasExpired = JwtDecoder.isExpired(store.read('token'));
      if(store.read('token') != null){
        return const Home();
      }else if(hasExpired){
        return const Login();
      }else{
        return const Login();
      }
    }catch(e){
      print(" this error $e in token expired and token is has checked function");
      return const Login();
    }
  }
}

