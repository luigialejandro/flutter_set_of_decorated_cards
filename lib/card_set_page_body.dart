import 'package:flutter/material.dart';
import 'package:flutter_set_of_decorated_cards/docs_required_card.dart';

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
            integratedCard(
                stepNumber: 1,
                stepIcon: Icon(
                  Icons.aod_outlined,
                  size: 35,
                  color: Colors.white,
                ),
                stepText1: 'Ingresa: ',
                stepText2: '✓ RFC a 13 posiciones',
                stepText3: '✓ Correo electrónico personal',
                stepText4: '✓ Número celular a 10 posiciones'),
            SizedBox(height: 1),
            integratedCard(
              stepNumber: 2,
              stepIcon: Icon(Icons.unarchive, size: 35, color: Colors.white),
              stepText1: '',
              stepText2: 'Ingresa la documentación',
              stepText3: 'requerida por la autoridad: ',
              stepText4: '✓ Identificación Oficial',
            ),
            SizedBox(height: 1),
            integratedCard(
              stepNumber: 3,
              stepIcon:
                  Icon(Icons.videocam_outlined, size: 35, color: Colors.white),
              stepText1: '',
              stepText2: '✓ Confirma tu identidad',
              stepText3: 'a través de un video',
              stepText4: '✓ Firma la solicitud',
            ),
            SizedBox(height: 30),
            buildButton(
                stepsTitle: 'Continuar',
                stepsIcon: Icons.arrow_forward,
                stepsColor: Color(0xffD9BCA3),
                stepsOnClicked: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DocsRequiredCard(),
                      ),
                    ))
          ],
        ),
      ),
    );
  }

  Widget integratedCard({
    required int stepNumber,
    required Icon stepIcon,
    required String stepText1,
    required String stepText2,
    required String stepText3,
    required String stepText4,
  }) {
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
                  planetCard(
                      stepText1: stepText1,
                      stepText2: stepText2,
                      stepText3: stepText3,
                      stepText4: stepText4),
                  planetThumbnail(stepIcon: stepIcon),
                ],
              ),
            ),
          ),
          ethereumElement(stepNumber: stepNumber),
        ],
      ),
    );
  }

  Widget ethereumElement({
    required int stepNumber,
  }) {
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
            'PASO ' + stepNumber.toString(),
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget planetThumbnail({
    required Icon stepIcon,
  }) {
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
            child: stepIcon,
          ),
        ),
      ),
    );
  }

  Widget planetCard({
    context,
    required String stepText1,
    required String stepText2,
    required String stepText3,
    required String stepText4,
  }) {
    return Container(
      height: 124,
      width: 400,
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
            stepText1,
            style: TextStyle(color: Colors.black, fontSize: 16),
          )),
          Container(
              child: Text(
            stepText2,
            style: TextStyle(color: Colors.black, fontSize: 16),
          )),
          Container(
              child: Text(
            stepText3,
            style: TextStyle(color: Colors.black, fontSize: 16),
          )),
          Container(
              child: Text(
            stepText4,
            style: TextStyle(color: Colors.black, fontSize: 16),
          )),
        ],
      )),
    );
  }

  Widget buildButton({
    required String stepsTitle,
    required IconData stepsIcon,
    required VoidCallback stepsOnClicked,
    required Color stepsColor,
  }) =>
      Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 55),
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
