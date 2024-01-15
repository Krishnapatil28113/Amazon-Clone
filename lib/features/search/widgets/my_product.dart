import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/features/search/widgets/stars.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class MyProduct extends StatelessWidget {
  const MyProduct({super.key, required this.product});
  final Product product;

  void NavigateToProductDetailsScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      ProductDetailsScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigateToProductDetailsScreen(context);
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10).copyWith(right: 0),
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  product.images[0],
                  fit: BoxFit.fitHeight,
                  // fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.height * 0.28,
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                // SizedBox(
                //   height: 5,
                // ),
                Stars(rating: 4),
                Text(
                  '\$' + product.price.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                Text('Eligible for FREE Shipping'),
                // SizedBox(
                //   height: 5,
                // ),
                Text(
                  'In Stock',
                  style: const TextStyle(
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
