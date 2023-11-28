import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_api/model_class/products_model_class.dart';
class ApiResponse{
  Future<Products?> products() async{
   try{
     Uri url = Uri.parse("https://uol-v-2.hostprohub.com/api/get-products?platform=app");
     var response = await http.get(url);
     // var data = jsonDecode(response.body);
     return productsFromJson(response.body);
   }catch(e){
     print( " ll =   $e" );
     return null;
   }
  }
  // Future<List<Datum>> productData() async{
  //   var recive = products();
  //   List<Datum> list = [];
  //   list.addAll(recive['data']['data'] );
  //
  // }
}