import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_ui/productDetails.dart';

import 'package:flutter_app_ui/productsModel.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductsModel> products = [];
  final api = "https://fakestoreapi.com/products";
  Future<List<ProductsModel>> getData() async {
    var response = await http.get(Uri.parse(api));
    var data = await jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        products.add(ProductsModel.fromJson(index));
      }
      return products;
    } else {
      return products;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 236, 236),
      body: SafeArea(
        child: Column(
          children: [
            // const SizedBox(
            //   height: 10,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "SomethingX",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: 5,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Container(
            //             width: 20,
            //             height: 10,
            //             color: Colors.red,
            //           ),
            //         );
            //       }),
            // ),
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: .85),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductDetailsPage(
                                      productdetails: products[index],
                                    )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 180,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Hero(
                                      tag: "image",
                                      child: Image.network(
                                        products[index].image.toString(),
                                        scale: 5,
                                      ),
                                    ),
                                  ),
                                  // child: Image.asset("assets/images/PhotoRoom-20230712_220452.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 2),
                                  child: Text(
                                    "${products[index].price.toString()}\$ ",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}


// GridView.builder(
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 2, childAspectRatio: 0.75),
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 width: 10,
//                                 height: 10,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(22),
//                                   color: Color.fromARGB(255, 189, 192, 193),
//                                 ),
//                                 // child: Image.asset("assets/images/PhotoRoom-20230712_220452.png"),
//                               );
//                             });





//  ListView.builder(
//                       itemCount: products.length,
//                       itemBuilder: (context, index) {
//                         return Text(products[index].title.toString());

//                         // Text(products[index].title.toString());
//                       },
//                     ),