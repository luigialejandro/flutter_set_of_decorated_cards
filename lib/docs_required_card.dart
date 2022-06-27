import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_set_of_decorated_cards/terms_conditions.dart';

class DocsRequiredCard extends StatefulWidget {
  DocsRequiredCard({Key? key}) : super(key: key);

  @override
  State<DocsRequiredCard> createState() => _DocsRequiredCardState();
}

class _DocsRequiredCardState extends State<DocsRequiredCard> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showAlertDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documentos'),
        centerTitle: true,
        backgroundColor: Color(0xff731F3E),
      ),
      body: buildDocsReqPage(context),
    );
  }

  Widget buildDocsReqPage(context) {
    return Center(
      child: Column(
        children: [
          integratedDocsCard(context),
          buildDocsButtons(context),
        ],
        //buildDocsButtons(context),
      ),
    );
  }

  Widget integratedDocsCard(context) {
    return Container(
        height: 415,
        //color: Color(0xff833F4C),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Stack(
          children: [
            mainDocsContainer(context),
            secondDocsContainer(context),
            thirdDocsContainer(context),
          ],
        ));
  }

  Widget mainDocsContainer(context) {
    return Container(
      //color: Colors.blue[500],
      height: 160,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Color(0xffD9BCA3),
        border: Border.all(width: 3.0, color: Color(0xff833F4C)),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          Text('Para poder generar o actualizar la',
              style: TextStyle(fontSize: 16)),
          Text('contraseña, deberás contar con alguno',
              style: TextStyle(fontSize: 16)),
          Text('de los siguientes documentos: ',
              style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget secondDocsContainer(context) {
    return Container(
      //color: Colors.blue[200],
      height: 240,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 60, right: 60, top: 150),
      alignment: FractionalOffset.bottomCenter,
      decoration: BoxDecoration(
        color: Color(0xffD9BCA3),
        border: Border.all(width: 3.0, color: Color(0xff833F4C)),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('✓ Credencial para votar', style: TextStyle(fontSize: 18)),
          Text('vigente, (INE).', style: TextStyle(fontSize: 18)),
          SizedBox(height: 12),
          Text('✓ Pasaporte vigente.', style: TextStyle(fontSize: 18)),
          SizedBox(height: 12),
          Text('✓ Cédula profesional.', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  Widget thirdDocsContainer(context) {
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
                Icons.unarchive,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDocsButtons(context) {
    return Container(
      child: Column(
        children: [
          buildButton(
            stepsTitle: 'Continuar',
            stepsIcon: Icons.arrow_forward,
            stepsOnClicked: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TermsConditions(),
              ),
            ),
            stepsColor: Color(0xffD9BCA3),
            stepsAvatarColor: Color(0xffD9BCA3),
          ),
          SizedBox(height: 15),
          buildButton(
            stepsTitle: 'Cancelar',
            stepsIcon: Icons.clear,
            stepsOnClicked: () {},
            stepsColor: Color(0xff833F4C),
            stepsAvatarColor: Color(0xff833F4C),
          ),
        ],
      ),
    );
  }

  Widget buildButton({
    required String stepsTitle,
    required IconData stepsIcon,
    required VoidCallback stepsOnClicked,
    required Color stepsColor,
    required Color stepsAvatarColor,
  }) =>
      Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 75),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: stepsColor,
              onPrimary: Colors.white,
              textStyle: TextStyle(fontSize: 20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                stepsTitle,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 23,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                    radius: 21,
                    backgroundColor: stepsAvatarColor,
                    child: Icon(stepsIcon, size: 24, color: Colors.white)),
              ),
            ],
          ),
          onPressed: stepsOnClicked,
        ),
      );

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
        child: Text("Continuar"),
        onPressed: () => {Navigator.of(context).pop()});

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Información importante"),
      content: Text(
          "Asegúrate de tener a la mano la documentación requerida. Si tienes dudas puedes verificar pulsando aquí."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
