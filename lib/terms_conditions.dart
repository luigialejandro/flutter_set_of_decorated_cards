import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Términos y condiciones'),
        centerTitle: true,
        backgroundColor: Color(0xff731F3E),
      ),
      body: buildTermsConditionsPage(context),
    );
  }

  Widget buildTermsConditionsPage(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      //color: Colors.blue[100],
      child: Column(
        children: [
          termsAndConditionsSpaceContainer(context),
          Spacer(),
          buttonsSpaceContainer(context),
        ],
      ),
    );
  }

  Widget termsAndConditionsSpaceContainer(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.62,
      decoration: BoxDecoration(
        color: Colors.white24,
        border: Border.all(width: 3.0, color: Color(0xff833F4C)),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
    );
  }

  Widget buttonsSpaceContainer(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      color: Colors.green[200],
    );
  }
}
