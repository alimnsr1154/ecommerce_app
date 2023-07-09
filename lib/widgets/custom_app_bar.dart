import 'package:flutter/material.dart';

class Custom_app_bar extends StatelessWidget implements PreferredSizeWidget{
  late String title;
  Custom_app_bar({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor:Colors.transparent,
      elevation: 0,
      title: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Text(
        title,
        style : Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [IconButton(onPressed: (){
        Navigator.pushNamed(context, '/wishlist');
      }, icon: Icon(Icons.favorite))],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
