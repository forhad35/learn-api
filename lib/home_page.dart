import 'package:flutter/material.dart';
import 'package:learn_api/response.dart';
import 'package:learn_api/ui/bdwash_all_catagory.dart';
import 'package:learn_api/ui/products_ui.dart';

import 'model_class/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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

            ],
          ),
        ) ,
      ),
    );
  }
}
