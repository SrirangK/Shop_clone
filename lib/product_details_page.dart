
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_clone/cart_provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String,Object> product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();

}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late int selectedsize;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedsize=0;
  }
  onTap(){
    if(selectedsize!=0){
      Provider.of<CartProvider>(context,listen: false).addProduct(
          {
            'id':widget.product['id'],
            'title':widget.product['title'],
            'price':widget.product['price'],
            'imageUrl':widget.product['imageUrl'],
            'company':widget.product['company'],
            'size':selectedsize
          });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product added to cart')));

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a size')));
    }

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,),
          ),
          const Spacer(flex: 1,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(flex: 2,),
          Container(
            // height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$${widget.product['price']}',style: Theme.of(context).textTheme.titleLarge,),
                SizedBox(height: 10,),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder:(context,index){
                        final size=(widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedsize=size;
                              });
                            },
                            child: Chip(
                                label:Text(size.toString()),
                              backgroundColor: selectedsize==size?Theme.of(context).primaryColor:Colors.white,
                            ),
                          ),
                        );
                      }
                  ),
                ),
                // SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.shopping_cart),
                    onPressed:onTap,
                    label:const  Text('Add to Cart',
                      style: TextStyle(color:Colors.black,fontSize: 18 ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),

                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
