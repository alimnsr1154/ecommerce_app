import 'package:flutter/material.dart';

class Custom_nav_bar extends StatelessWidget {
  const Custom_nav_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height : 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, '/');
            }, icon: Icon(Icons.home,size: 35.0,color: Colors.white,)),
            IconButton(onPressed: (){
              Navigator.pushNamed(context, '/cart');
            }, icon: Icon(Icons.shopping_cart,size: 35.0,color: Colors.white,)),
            IconButton(onPressed: (){
              Navigator.pushNamed(context, '/user');
            }, icon: Icon(Icons.person,size: 35.0,color: Colors.white,)),
          ],
        ),
      ),
    );
  }
}