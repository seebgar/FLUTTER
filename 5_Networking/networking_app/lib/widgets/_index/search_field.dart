import 'package:flutter/material.dart';
import 'package:networking_app/constants.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 33.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                14.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 12),
                  blurRadius: 16.0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                cursorColor: kPrimaryLabelColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: kPrimaryLabelColor,
                    size: 20.00,
                  ),
                  border: InputBorder.none,
                  hintText: "Search...",
                  hintStyle: kSearchPlaceholderStyle,
                ),
                style: kSearchTextStyle,
                onChanged: (newText) {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
