import 'package:flutter/material.dart';
import 'package:flutter_app_ui/productsModel.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.productdetails});
  final ProductsModel productdetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 181, 176, 176),
                borderRadius: BorderRadius.circular(19),
              ),
              child: Text(
                "Add to Cart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.25,
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 173, 157, 155),
              borderRadius: BorderRadius.circular(19),
            ),
            child: Text(
              "${productdetails.price.toString()} \$",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 300,
              child: Hero(
                tag: "image",
                child: Image.network(
                  productdetails.image.toString(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              productdetails.title.toString(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Text(productdetails.price.toString()),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              alignment: Alignment.center,
              child: Text(
                productdetails.description.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 48, 44, 44),
                ),
              ),
            ),
            // Text(productdetails.toString()),
          ],
        ),
      ),
    );
  }
}
