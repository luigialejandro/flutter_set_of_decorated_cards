import 'package:flutter/material.dart';

class IdentityVerification extends StatefulWidget {
  IdentityVerification({Key? key}) : super(key: key);

  @override
  State<IdentityVerification> createState() => _IdentityVerificationState();
}

class _IdentityVerificationState extends State<IdentityVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verificación de Identidad'),
        centerTitle: true,
        backgroundColor: Color(0xff731F3E),
      ),
      body: identityVerificationBodyPage(context),
    );
  }

  Widget identityVerificationBodyPage(context) {
    return Container(
      //color: Colors.orange[200],
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          inspirationalQuoteCard(context),
          indicationButtons(context),
        ],
      ),
    );
  }

  inspirationalQuoteCard(context) {
    return Container(
        height: 450,
        //color: Color(0xff833F4C),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Stack(
          children: [
            rectangleIndicationsContainerElement(context),
            quoteSpaceContainer(context),
            avatarIndicationsContainerElement(context),
          ],
        ));
  }

  Widget rectangleIndicationsContainerElement(context) {
    return Container(
        //color: Colors.blue[500],
        height: 210,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        decoration: BoxDecoration(
          color: Color(0xffD9BCA3),
          border: Border.all(width: 3.0, color: Color(0xff833F4C)),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 12),
            Text(
              'Para validar tu identidad, es necesario grabar un video enfocando el rostro, así mismo, durante la grabación del video debes mencionar la siguiente frase: ',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            )
          ],
        ));
  }

  Widget quoteSpaceContainer(context) {
    return Container(
      //color: Colors.blue[200],
      height: 300,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20, right: 20, top: 190),
      alignment: FractionalOffset.bottomCenter,
      decoration: BoxDecoration(
        color: Color(0xffD9BCA3),
        border: Border.all(width: 3.0, color: Color(0xff833F4C)),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Center(
        child: Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 3.0, color: Color(0xff833F4C)),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 18, right: 3, top: 15, bottom: 15),
            child: Scrollbar(
              isAlwaysShown: true,
              thickness: 8,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(right: 18),
                  child: Text(
                    'Labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget avatarIndicationsContainerElement(context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 70,
        height: 70,
        //margin: EdgeInsets.symmetric(horizontal: 150),
        //color: Colors.red,
        child: CircleAvatar(
          backgroundColor: Color(0xff833F4C),
          radius: 35,
          child: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 29,
              backgroundColor: Color(0xff833F4C),
              child: Icon(
                Icons.videocam_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }

  indicationButtons(context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.green,
      height: 140,
    );
  }
}
