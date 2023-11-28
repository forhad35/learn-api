import 'package:flutter/material.dart';
import 'package:learn_api/reposetory/all_category.dart';
import '../model_class/bd_wash_all_catagory.dart';
class BDWashAllCategory extends StatefulWidget {
  const BDWashAllCategory({super.key});
  @override
  State<BDWashAllCategory> createState() => _BDWashAllCategoryState();
}
class _BDWashAllCategoryState extends State<BDWashAllCategory> with TickerProviderStateMixin{
    List<Datum>  data = [];
   dynamic _tabController;
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

  @override
  Widget build(BuildContext context) {
    // tabBarBody();
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
                  tabs: data.map((Datum category) =>Tab(
                    text: category.name,
                  ) ).toList(),
                ),
              ),
              SizedBox(
                width: 500,
                height: 700,
                child: TabBarView(
                  controller: _tabController,
                  children:data.map((category) => Column(
                      children: category.products.map((Product item) => ListTile(
                        title: Text(item.name),
                        leading: Text(item.price.toString()),
                      )).toList()
                  )).toList()

                ),)]
        ),
        ):const Center(child: CircularProgressIndicator()),
    );
  }
}


