import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../APIS/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context).cart;
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Cart')),

        ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: cart.length,
          itemBuilder: (context,index){
            final cartitem=cart[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(cartitem['imageUrl'] as String),
                  radius: 30,
                ),
                trailing: IconButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder:(context){
                          return AlertDialog(
                            title: Text('Delete product?',style: Theme.of(context).textTheme.bodyMedium,),
                            content: Text('Are you sure you want to delete product?'),
                            actions: [
                              TextButton(
                                  onPressed: (){
                                Provider.of<CartProvider>(context,listen: false).removeProduct(cartitem);
                                Navigator.of(context).pop();
                              },
                                  child: Text('Yes',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                              TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('No',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
                            ],
                          );
                        });
                  },
                  icon:const Icon(Icons.delete,color: Colors.red,),),
                title: Text(cartitem['title'].toString(),style: Theme.of(context).textTheme.bodySmall,),
                subtitle: Text("size:${cartitem['size']}"),
              
              ),
            );
          }
      ),
    );
  }
}
