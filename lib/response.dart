import 'package:http/http.dart' as http;

import 'model_class/model.dart';
class AllPosts{
 static Future<List<DataModel>?> allPost()async{
    try{
      Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var respons = await http.get(url);
      return dataModelFromJson(respons.body.toString());
    }catch(e){
      return null;
    }
  }

}