import 'package:flutter/material.dart';

class Custom_app_bar extends StatelessWidget implements PreferredSizeWidget{
  late String title;
  Custom_app_bar({
    super.key,
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
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Text(
        title,
        style : Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [IconButton(onPressed: (){
        Navigator.pushNamed(context, '/wishlist');
      }, icon: const Icon(Icons.favorite))],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}
