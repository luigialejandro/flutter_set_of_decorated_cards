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
      color: Colors.orange[200],
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          indicationToFollowText(context),
          inspirationalQuoteSpace(context),
          indicationButtons(context),
        ],
      ),
    );
  }

  indicationToFollowText(context) {
    return Container(
      color: Colors.redAccent,
      height: 220,
    );
  }

  inspirationalQuoteSpace(context) {
    return Container(
      color: Colors.lightBlue,
      height: 220,
    );
  }

  indicationButtons(context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.green,
      height: 150,
    );
  }
}
