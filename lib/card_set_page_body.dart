import 'package:flutter/material.dart';

class CardSetPageBody extends StatelessWidget {
  const CardSetPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24,
      ),
      child: Stack(
        children: [
          planetCard(context),
          planetThumbnail(context),
        ],
      ),
    );
  }
}

Widget planetThumbnail(context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 16),
    alignment: FractionalOffset.centerLeft,
    child: CircleAvatar(
      radius: 50,
      child: Icon(Icons.ac_unit_sharp),
    ),
  );
}

Widget planetCard(context) {
  return Container(
    height: 124,
    margin: EdgeInsets.only(left: 46),
    decoration: BoxDecoration(
      color: Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: Offset(0.0, 10.0),
        ),
      ],
    ),
  );
}
