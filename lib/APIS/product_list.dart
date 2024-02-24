import 'package:flutter/material.dart';
import '../Products/global_variables.dart';
import 'product_card.dart';
import '../Screens/product_details_page.dart';

class Product_list extends StatefulWidget {
  const Product_list({Key? key}) : super(key: key);

  @override
  State<Product_list> createState() => _Produc_listState();
}

class _Produc_listState extends State<Product_list> {
  final List<String> filters=const ['All','Adidas','Nike','Bata'];
  late String selectedfilter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedfilter=filters[0];
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
              children:[
                Padding(
                  padding:const  EdgeInsets.all(20.0),
                  child: Text('Shoes\n Collection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "search",
                        prefixIcon: Icon(Icons.search),
                        border:OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(225, 225  ,225, 1),
                          ),
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
                        ),
                      ),
                    )
                )
              ]
          ),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder:(context,index){
                  final filter=filters[index];
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedfilter=filter;
                        });

                      },
                      child: Chip(
                        padding: EdgeInsets.only(top: 8,bottom: 8,left: 12,right: 12),
                        label: Text(filter),
                        labelStyle: TextStyle(fontSize: 16),
                        side: BorderSide(color: Color.fromRGBO(249, 249, 249, 1)),
                        backgroundColor: selectedfilter==filter?Theme.of(context).primaryColor:Color.fromRGBO(220, 220, 220, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount:products.length,
                itemBuilder:(context,index){
                  final product=products[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(context){return ProductDetailPage(product: product);}));
                    },
                    child: ProductCard(
                      Title:product['title'] as String,
                      price: product['price'] as double ,
                      image: product['imageUrl'] as String,
                      backgroundcolor: index%2==0? Color.fromRGBO(216, 240, 253, 1):Color.fromRGBO(220, 220, 220, 1),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
