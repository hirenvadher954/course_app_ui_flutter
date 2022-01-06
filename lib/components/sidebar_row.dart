import 'package:facts_flutter_app/models/sidebar.dart';
import 'package:flutter/material.dart';

class SidebarRow extends StatelessWidget {
  const SidebarRow({required this.item});

  final SidebarItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 42,
            height: 42,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: item.background,
            ),
            child: item.icon),
        SizedBox(
          width: 12,
        ),
        Container(
            child: Text(
          item.title,
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: 16.0, color: Colors.grey),
        )),
      ],
    );
  }
}
