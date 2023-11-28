import 'package:flutter/material.dart';
import 'package:learn_api/reposetory/product_category_api_response.dart';
import 'package:learn_api/ui/bosssend_product-details.dart';

import '../model_class/bosssend_product_under-category.dart';
class ProductUnderCategory extends StatefulWidget {
  int id;
   ProductUnderCategory({required this.id,super.key});

  @override
  State<ProductUnderCategory> createState() => _ProductUnderCategoryState();
}

class _ProductUnderCategoryState extends State<ProductUnderCategory> {
  List<Datum> data = [];
  bool isResponse = true;
  fetchData() async{
    var res = await BossendApiresponse.underCategoryResponse(widget.id);
    if( res != null){
      data= res.data.data;
    }else{
      isResponse = false;
    }
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
        title: const Text(" Under Category"),
      ),
      body: isResponse ? data.isNotEmpty?ListView.builder(
        itemCount: data.length,
          itemBuilder: (context,index){
        return Card(
          margin:const EdgeInsets.all(10),
          elevation: 5,
          child: ListTile(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(slug: data[index].slug))),
            contentPadding: const EdgeInsets.all(5),
            tileColor: Colors.white,
            title: Text(data[index].name),
            trailing: Text(data[index].price.toString()),
            leading: SizedBox(
              height:100 ,
              width: 100,
              child: Image.network(data[index].primaryImage),
            ),
          ),
        );
      }):const Center(child: CircularProgressIndicator(),): Center(
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.redAccent,width: 2,),
          ),
            child: Text("No Data Found",style: TextStyle(fontSize: 20,color: Colors.redAccent),)
        ),
      ),
    );
  }
}
