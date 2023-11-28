import 'package:flutter/material.dart';
import 'package:learn_api/response.dart';

import 'model_class/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DataModel> data = [];
  bool isResponds = false;
  var errorMsg = "";
  fetchData ()async{
    var responds = await AllPosts.allPost();
    if(responds!=null){
      data.addAll(responds);
      isResponds = true;
    }else{
      errorMsg= " Error";
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
        title: Text("  Api"),
      ),
      body: Container(
        child:Center(
          child: dataValid(),
        ) ,
      ),
    );
  }
 dataValid(){
   if( data.isNotEmpty && isResponds){
     return ListView.builder(itemBuilder: (context,index){
       return ListTile(
         title: Text(data[index].title),
         subtitle: Text(data[index].body),
         leading: Text("${data[index].id}"),
       );
     });

   } else if( errorMsg.isNotEmpty){
     return Text(errorMsg);
   } else {
     return CircularProgressIndicator();
   }
 }
}
