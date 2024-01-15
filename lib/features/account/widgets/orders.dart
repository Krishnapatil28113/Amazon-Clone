import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    "https://m.media-amazon.com/images/G/31/img21/Wireless/katariy/Apple/iphone_SE/preorder/AMZ_FamilyStripe_iphone_13_mini._CB626819224_.png",
    "https://m.media-amazon.com/images/G/31/img21/Wireless/katariy/Apple/iphone_SE/preorder/AMZ_FamilyStripe_iphone_13_mini._CB626819224_.png",
    "https://m.media-amazon.com/images/G/31/img21/Wireless/katariy/Apple/iphone_SE/preorder/AMZ_FamilyStripe_iphone_13_mini._CB626819224_.png",
    "https://m.media-amazon.com/images/G/31/img21/Wireless/katariy/Apple/iphone_SE/preorder/AMZ_FamilyStripe_iphone_13_mini._CB626819224_.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Your Orders',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(
                      color: GlobalVariables.selectedNavBarColor,
                      fontSize: 15,
                    ),
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: ((context, index) {
              return SingleProduct(
                image: list[index],
              );
            }),
          ),
        ),
      ],
    );
  }
}
