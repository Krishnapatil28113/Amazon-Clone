import 'package:flutter/material.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: const Text(
              'Deal of the day!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Image.network(
            'https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/71TPda7cwUL._AC_UF1000,1000_QL80_.jpg',
            fit: BoxFit.cover,
            height: height * 0.25,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: const Text(
              '\$100',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(
              left: 15,
              top: 5,
              right: 40,
            ),
            child: Text(
              'MacBook',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SingleChildScrollView(
            child: Row(
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDIqyCds007pSIIlALzgYKDFVzrSw3iLe5o2nVkG0DXFqDeNPUVu7mmKq7L9A-ZVdHN2Y&usqp=CAU',
                  fit: BoxFit.fitWidth,
                  height: 100,
                  width: 100,
                ),
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDIqyCds007pSIIlALzgYKDFVzrSw3iLe5o2nVkG0DXFqDeNPUVu7mmKq7L9A-ZVdHN2Y&usqp=CAU',
                  fit: BoxFit.fitWidth,
                  height: 100,
                  width: 100,
                ),
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDIqyCds007pSIIlALzgYKDFVzrSw3iLe5o2nVkG0DXFqDeNPUVu7mmKq7L9A-ZVdHN2Y&usqp=CAU',
                  fit: BoxFit.fitWidth,
                  height: 100,
                  width: 100,
                ),
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDIqyCds007pSIIlALzgYKDFVzrSw3iLe5o2nVkG0DXFqDeNPUVu7mmKq7L9A-ZVdHN2Y&usqp=CAU',
                  fit: BoxFit.fitWidth,
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(vertical: 15).copyWith(
              left: 15,
            ),
            child: Text(
              'See all deals',
              style: TextStyle(
                color: Colors.cyan[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
