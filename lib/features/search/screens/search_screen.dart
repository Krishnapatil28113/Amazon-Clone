import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/search/services/search_services.dart';
import 'package:amazon_clone/features/search/widgets/my_product.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.name});
  static const String routeName = '/search';
  final String name;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // @override

  List<Product>? productsList;
  final searchServices = new SearchServices();
  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
  }

  void fetchSearchedProduct() async {
    productsList = await searchServices.fetchSearchedProduct(
      context,
      widget.name,
    );
    setState(() {});
  }

  Widget build(BuildContext context) {
    return productsList == null
        ? const Loader()
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: AppBar(
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: GlobalVariables.appBarGradient,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/amazon_in.png',
                        width: 120,
                        height: 45,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Column(
              children: [
                const AddressBox(),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: productsList!.length,
                    itemBuilder: (context, index) {
                      final product = productsList![index];
                      return MyProduct(product: product);
                    },
                  ),
                  // child: GridView.builder(
                  //   scrollDirection: Axis.vertical,
                  //   itemCount: productsList!.length,
                  //   itemBuilder: (context, index) {
                  //     final product = productsList![index];
                  //     return Column(
                  //       children: [
                  //         SizedBox(
                  //           height: 100,
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(10),
                  //             child: Image.network(product.images[0]),
                  //           ),
                  //         ),
                  //         Container(
                  //           padding: const EdgeInsets.all(10),
                  //           child: Text(product.name),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  //   gridDelegate:
                  //       const SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2,
                  //     mainAxisSpacing: 10,
                  //     childAspectRatio: 1.4,
                  //   ),
                  // ),
                ),
              ],
            ),
          );
  }
}
