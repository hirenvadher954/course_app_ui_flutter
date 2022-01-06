import 'package:flutter/material.dart';
import '../constants.dart';

class SidebarButton extends StatelessWidget {
     SidebarButton({required this.triggerAnimation});
      final Function triggerAnimation;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () => triggerAnimation(),
      constraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
                color: kShadowColor,
                offset: Offset(0, 12),
                blurRadius: 16.0,)
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Image.asset(
          'assets/icons/icon-sidebar.png',
          color: kPrimaryLabelColor,
        ),
      ),
    );
  }
}
