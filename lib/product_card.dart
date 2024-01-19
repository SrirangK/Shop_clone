import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String Title;
  final double price;
  final String image;
  final Color backgroundcolor;
  const ProductCard({Key? key, required this.Title, required this.price, required this.image, required this.backgroundcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),

      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: backgroundcolor,
          borderRadius: BorderRadius.circular(20)

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Title, style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 5,),
          Text('\$$price',style: Theme.of(context).textTheme.bodySmall,),
          SizedBox(height: 5,),
          Center(child: Image.asset(image,height: 170,))
      
        ],
      ),
    );
  }
}
