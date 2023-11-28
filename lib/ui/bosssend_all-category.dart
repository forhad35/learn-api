import 'package:flutter/material.dart';
import 'package:learn_api/reposetory/product_category_api_response.dart';

import '../model_class/bosssend_product-category.dart';
import 'bosssend_product_under-category.dart';
class BosssendAllCategory extends StatefulWidget {
  const BosssendAllCategory({super.key});

  @override
  State<BosssendAllCategory> createState() => _BosssendAllCategoryState();
}

class _BosssendAllCategoryState extends State<BosssendAllCategory> {
  List<Datum> data = [];
  fetchData()async{
    var response = await BossendApiresponse.categoryResponse();
    data.addAll(response.data);
    setState(() {

    });
  }
  @override
  void initState() {
    fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Category"),
      ),
      body: data.isNotEmpty? Container(
        child: ListView.builder(
          itemCount: data.length,
            itemBuilder: (context,index){
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductUnderCategory(id: data[index].id,)));
            },
            title: Text(data[index].name),
          );
        }),
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}
