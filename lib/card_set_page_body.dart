import 'package:flutter/material.dart';

class CardSetPageBody extends StatelessWidget {
  const CardSetPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //color: Colors.amber,
        margin: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            integratedCard(context),
            SizedBox(height: 10),
            integratedCard(context),
            SizedBox(height: 10),
            integratedCard(context),
          ],
        ),
      ),
    );
  }
}

Widget integratedCard(context) {
  return Container(
    height: 190,
    //color: Colors.blueAccent,
    child: Stack(
      children: [
        Center(
          child: Container(
            height: 120,
            child: Stack(
              children: [
                planetCard(context),
                planetThumbnail(context),
              ],
            ),
          ),
        ),
        ethereumElement(context),
      ],
    ),
  );
}

Widget ethereumElement(context) {
  return Align(
    alignment: Alignment.topRight,
    child: Container(
      width: 120,
      height: 50,
      margin: EdgeInsets.only(top: 10, right: 16),
      alignment: FractionalOffset.topRight,
      decoration: BoxDecoration(
          color: Color(0xff833F4C),
          border: Border.all(width: 4.0, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      child: Center(
        child: Text(
          'PASO N',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

Widget planetThumbnail(context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 16),
    alignment: FractionalOffset.centerLeft,
    child: CircleAvatar(
      backgroundColor: Color(0xffD9BCA3),
      radius: 50,
      child: CircleAvatar(
        radius: 36,
        backgroundColor: Colors.white,
        child: CircleAvatar(
            radius: 33,
            backgroundColor: Color(0xff833F4C),
            child: Icon(
              Icons.document_scanner_rounded,
              color: Colors.white,
              size: 34,
            )),
      ),
    ),
  );
}

Widget planetCard(context) {
  return Container(
    height: 124,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.only(left: 46),
    decoration: BoxDecoration(
      color: Color(0xffD9BCA3),
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
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: Text(
          'Text No 1',
          style: TextStyle(color: Colors.white),
        )),
        Container(
            child: Text(
          'Text No 2',
          style: TextStyle(color: Colors.white),
        )),
        Container(
            child: Text(
          'Text No 3',
          style: TextStyle(color: Colors.white),
        )),
        Container(
            child: Text(
          'Text No 4',
          style: TextStyle(color: Colors.white),
        )),
      ],
    )),
  );
}
