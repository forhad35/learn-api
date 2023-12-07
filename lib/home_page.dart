import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:learn_api/ui/bdwash_all_catagory.dart';
import 'package:learn_api/ui/bosssend_all-category.dart';
import 'package:learn_api/ui/login.dart';
import 'package:learn_api/ui/products_ui.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var storage = GetStorage();
  @override
  void initState() {
    super.initState();
  }
  tokenDecode(){
    try{
      Map<String,dynamic> tokenData= JwtDecoder.decode(storage.read('token'));
      print(tokenData);
      var date = DateTime.now();
      var iat = DateTime.fromMillisecondsSinceEpoch(tokenData['iat'] *1000);
      print(iat);
      // var da = tokenData['exp']*1000;
      var exp = DateTime.fromMillisecondsSinceEpoch(tokenData['exp']*1000);
      print(exp);
      print(exp.isAfter(date));
      print(date);


    }catch(e){
      print(" sjd $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    print(storage.read('token'));
    return Scaffold(
      appBar: AppBar(
        title: Text("  Api"),
      ),
      body: Container(
        child:Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const BDWashAllCategory())), child: Text("BD Wash")),
              ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductsUi())), child: Text("Product card")),
              ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const BosssendAllCategory())), child: Text("Bosssend Category")),
              ElevatedButton(onPressed:(){
                storage.erase();
                setState(() {
                });
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()),(route)=>false);

              },child: Text("Log out")),
              OutlinedButton(onPressed: ()=>tokenDecode(), child: Text("token decode"))
            ],
          ),
        ) ,
      ),
    );
  }
}
