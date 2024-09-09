import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color color;
  final Color bgColor;
  final IconData actionIcon ;
  final bool leadingIconPresent;
  final bool centerTitle;
  const Appbar({super.key, required this.title, required this.actionIcon, required this.leadingIconPresent, required this.color, required this.bgColor, required this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: bgColor,
      title: Text(title, style: TextStyle(color: color),),
      actions: [
        Icon(actionIcon, color: color),
        const Text("    ")
      ],
      iconTheme: IconThemeData(
        color: color,
        size: 20,
      ),
      // leading: const Icon(Icons.menu),
      automaticallyImplyLeading: leadingIconPresent,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
