import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          DrawerHeader(child:
            Image.asset(
              'lib/images/logo.png',
              width: 180,
            ))

          //home list title

          //settings list title

          //logout list tile
        ],
      ),
    );
  }
}