import 'package:flutter/material.dart';
import 'package:learn_api/reposetory/api_response.dart';
import 'package:flutter/src/widgets/image.dart' as images;

import '../model_class/products_model_class.dart';
class ProductsUi extends StatefulWidget {
  const ProductsUi({super.key});

  @override
  State<ProductsUi> createState() => _ProductsUiState();
}

class _ProductsUiState extends State<ProductsUi> {
  // Map<String,dynamic> data ={};
  List<Datum> data =[];
 bool isHas = false;
  fetchData() async{
    var responseData = await ApiResponse().products();
    if(responseData != null){
      isHas= true;
      data.addAll(responseData.data.data);
      setState(() {

      });
    }
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
        title:const Text(" Product card"),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height*0.45,
        child: dataView(),
      ),
    );
  }
  dataView(){
     if(data.isNotEmpty && isHas){
      int dataItems = data.length;
      return ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: dataItems,
          itemBuilder: (context,index){
            var dataIndex = data[index];
            return Card(
              margin: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black12,width: 1.5),
                borderRadius: BorderRadius.circular(15)
              ),
              clipBehavior: Clip.hardEdge,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child:image(data[index].image.small) ,
                  ),
                 Container(
                   padding: EdgeInsets.all(10),
                   child: Column(
                     children: [
                       RichText(text: TextSpan(
                           children: [
                             TextSpan(
                                 text: dataIndex.formattedFinalProductPrice,style: const TextStyle(color: Colors.black)
                             ),
                             TextSpan(
                                 text: dataIndex.formattedRegularPrice,
                                 style: const TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey,height: 3)
                             )
                           ]
                       )),
                       Text(dataIndex.name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
                       OutlinedButton(onPressed: (){}, child: const Padding(
                         padding: EdgeInsets.all(10.0),
                         child: Text("Buy Now"),
                       ))
                     ],
                   ),
                 )
              
                ],
              )
            );
          });
    }else {
        return const Center(child: CircularProgressIndicator(),);
      }
  }
 Widget image (String url){
    return Container(
      // width: 200,
      height: 200,
      child: images.Image.network(url,fit: BoxFit.fill,),
    );
  }
}
