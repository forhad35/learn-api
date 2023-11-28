import 'package:http/http.dart' as http;
import 'package:learn_api/ui/bdwash_all_catagory.dart';

import '../model_class/bd_wash_all_catagory.dart';

class AllCategory{
  static Future<AllCategoryBdWash> allCategory() async{
    var url = Uri.parse("https://wash.bssgroupbd.com/public/api/all-services/with-all-products");
    var response =await http.get(url);
    return allCategoryBdWashFromJson(response.body);
  }
}