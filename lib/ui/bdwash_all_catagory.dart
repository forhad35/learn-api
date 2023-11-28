import 'package:flutter/material.dart';
import 'package:learn_api/reposetory/all_category.dart';
import '../model_class/bd_wash_all_catagory.dart';
class BDWashAllCategory extends StatefulWidget {
  const BDWashAllCategory({super.key});
  @override
  State<BDWashAllCategory> createState() => _BDWashAllCategoryState();
}
class _BDWashAllCategoryState extends State<BDWashAllCategory> with TickerProviderStateMixin{
   late List<Datum> data=[];
   dynamic _tabController;
   List<Widget> tabBarView=[];
   fetchData()async{
    var response = await AllCategory.allCategory();
    data = response.data;
    _tabController = TabController(length: data.length, vsync: this);
    setState(() {
     });
   }
   @override
  void initState() {
    fetchData();
    super.initState();
  }
  int index = 0;
  @override
  Widget build(BuildContext context) {
    tabBarBody();
    return  Scaffold(
      appBar: AppBar(
        title: const Text("All Category"),
      ),
      body: data.isNotEmpty ?SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
            children: [
              Container(
                color: Colors.green,
                height: 60,
                child: TabBar(
                  controller: _tabController,
                  tabs: [
                    for( var item in data)
                      Tab(
                        text: item.name,
                      )
                  ],),
              ),
              Container(
                width: 500,
                height: 700,
                // color: Colors.red,
                child: TabBarView(
                  controller: _tabController,
                  children: tabBarView
                ),)]
        ),
        ):const Center(child: CircularProgressIndicator()),
    );
  }
   tabBarBody(){
     for(var category in data){
       tabBarView.add(Column(
         children: [
           for(var items in category.products)
             ListTile(
               contentPadding:const EdgeInsets.all(10),
               leading: Image.network(items.image),
               title: Text(items.name),
               trailing: Text(items.price.toString()),

             )
         ],
       ));
     }
   }
}


