import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:learn_api/reposetory/product_category_api_response.dart';

import '../model_class/bosssend_product-details.dart';

class ProductDetails extends StatefulWidget {
  String slug;
   ProductDetails({required this.slug,super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
    Data? data ;
  // bool isResponse = true;
  fetchData()async{
    var res = await BossendApiresponse.productDetails(widget.slug);
    data = res!.data;
    // isResponse = false;
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

    print(widget.slug);
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text(" Product Details"),
      ),
      body: data != null ? Container(
        child: ListTile(
          title: Text(data!.name),
          trailing: Text(data!.categoryName),
          subtitle: Html(data: data!.shortDescription),
        )
      ):Center(child: CircularProgressIndicator(),)
    );
  }
}
