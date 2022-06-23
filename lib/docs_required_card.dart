import 'dart:math';

import 'package:flutter/material.dart';

class DocsRequiredCard extends StatefulWidget {
  DocsRequiredCard({Key? key}) : super(key: key);

  @override
  State<DocsRequiredCard> createState() => _DocsRequiredCardState();
}

class _DocsRequiredCardState extends State<DocsRequiredCard> {
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
        color: Colors.yellow,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.blue[500],
        border: Border.all(width: 4.0, color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
    );
  }

  Widget secondDocsContainer(context) {
    return Container(
      //color: Colors.blue[200],
      height: 260,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 60, right: 60, top: 130),
      alignment: FractionalOffset.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.blue[200],
        border: Border.all(width: 4.0, color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
          radius: 35,
          backgroundColor: Colors.green[200],
        ),
      ),
    );
  }

  Widget buildDocsButtons(context) {
    return Container(
      child: Column(
        children: [
          buildButton(
            stepsTitle: 'Iniciar trámite',
            stepsIcon: Icons.arrow_forward,
            stepsOnClicked: () {},
            stepsColor: Colors.blueAccent,
          ),
          SizedBox(height: 15),
          buildButton(
            stepsTitle: 'Cancelar',
            stepsIcon: Icons.clear,
            stepsOnClicked: () {},
            stepsColor: Colors.orange,
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
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 23,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                    radius: 21,
                    backgroundColor: Color(0xff833F4C),
                    child: Icon(stepsIcon, size: 24, color: Colors.white)),
              ),
            ],
          ),
          onPressed: stepsOnClicked,
        ),
      );
}
