

import 'package:flutter/material.dart';
import 'package:shop_clone/cart_page.dart';
import 'package:shop_clone/product_list.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> pages=[Product_list(),CartPage()];
  int currentpage=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(
        index: currentpage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentpage,
        selectedItemColor: Colors.yellow,
        onTap: (value){
          setState(() {
            currentpage=value;
          });
        },
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.home,),
              label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: '')
        ],


      ),
    );
  }
}
