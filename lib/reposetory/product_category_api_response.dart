import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model_class/bosssend_product-category.dart';
import '../model_class/bosssend_product-details.dart';
import '../model_class/bosssend_product_under-category.dart';
class BossendApiresponse{
  static Future<AllCategoryBosssend> categoryResponse() async{
    var url = Uri.parse("https://admin.bosssend.com/api/categories");
    var response =await http.get(url);
    return allCategoryBosssendFromJson(response.body);
  }
  static Future<BosssendUnderCategory?> underCategoryResponse(id) async{
    var url = Uri.parse("https://admin.bosssend.com/api/products/under-category/$id");
    var response =await http.get(url);
    if(response.statusCode == 200){
      var res=  jsonDecode(response.body);
      if(res['success']){
        return bosssendUnderCategoryFromJson(response.body);
      }else{
        return null;
      }
    }else{
      return null;
    }
  }
  static Future<BosssendProductDetails?> productDetails(slug) async{
    var url = Uri.parse("https://admin.bosssend.com/api/products/view/$slug");
    var response =await http.get(url);
    print(response.body);
    return bosssendProductDetailsFromJson(response.body);
  }

}