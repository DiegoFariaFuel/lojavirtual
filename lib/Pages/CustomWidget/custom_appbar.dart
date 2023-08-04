import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
 
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(title,
          // ignore: deprecated_member_use
          style: Theme.of(context)
              .textTheme
              // ignore: deprecated_member_use
              .headline2!
              .copyWith(color: Colors.black)),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Wishlist');
            },
            icon: const Icon(Icons.favorite)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
