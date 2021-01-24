import 'package:flutter/material.dart';
import 'package:networking_app/constants.dart';

class SideBarButton extends StatelessWidget {
  final Function triggerAnimation;

  const SideBarButton({
    @required this.triggerAnimation,
    Key key,
  }) : super(key: key);

  void _onAnimate() {
    triggerAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: _onAnimate,
      // * fot tapping inside
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: BoxConstraints(
        maxWidth: 40.0,
        maxHeight: 40.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: const [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0, 12),
              blurRadius: 16.0,
            ),
          ],
        ),
        child: Image.asset(
          "assets/icons/icon-sidebar.png",
          color: kPrimaryLabelColor,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 14.0,
        ),
      ),
    );
  }
}
