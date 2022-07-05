import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_set_of_decorated_cards/identity_record.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class IdentityVerification extends StatefulWidget {
  IdentityVerification({Key? key}) : super(key: key);

  @override
  State<IdentityVerification> createState() => _IdentityVerificationState();
}

class _IdentityVerificationState extends State<IdentityVerification> {
  VideoPlayerController? cameraVideoPlayerController;

  Future pickVideoFromCamera() async {
    try {
      final pickedVideo =
          await ImagePicker().pickVideo(source: ImageSource.camera);
      if (pickedVideo != null) {
        final cameraVideoFile = File(pickedVideo!.path);

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  IdentityRecord(cameraVideo: cameraVideoFile)),
        );
      }
      ;
/*
      setState(() => this.cameraVideo = cameraVideoFile);
      cameraVideoPlayerController = VideoPlayerController.file(cameraVideoFile)
        ..initialize().then((_) {
          setState(() {});
          cameraVideoPlayerController?.play();
        });
        */
    } catch (e) {
      print('Failed to pick video: $e');
    }
  }

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
          SizedBox(height: 20),
          recordAndAnotherQuoteButtons(context),
        ],
      ),
    );
  }

  inspirationalQuoteCard(context) {
    return Container(
        height: 420,
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
    List<String> listOfQuotes = [
      'Sobre la montaña florida sueltan los caballos en el cielo otoñal',
      'Yo soñaba cada día poder alcanzar la playa',
      'El misterio de la vida no es un problema a resolver, sino una realidad a experimentar',
      'Estar solo no tiene nada que ver con cuantas personas hay alrededor',
      'El hombre débil se vuelve fuerte cuando no tiene nada, porque sólo entonces puede sentir la locura de la desesperación',
      'Mientras el corazón late, mientras el cuerpo y alma siguen juntos, no puedo admitir que cualquier criatura dotada de voluntad tiene necesidad de perder la esperanza en la vida'
          'Cada libro, cada volumen que ves aquí, tiene un alma. El alma de la persona que lo escribió y de aquellos que lo leyeron, vivieron y soñaron con él. Cada vez que un libro cambia de manos, cada vez que alguien baja sus ojos a las páginas, su espíritu crece y se fortalece',
      'Mi consejo es: nunca hagas mañana lo que puedes hacer hoy. La procrastinación es la ladrona del tiempo',
      'Conseguir lo que quieres es tan difícil como no conseguir lo que quieres. Porque entonces tienes que averiguar qué hacer con ello, en lugar de averiguar qué hacer sin ello.',
      'Crearía un perfume que no sólo fuera humano, sino sobrehumano. Un aroma de ángel, tan indescriptiblemente bueno y pletórico de vigor que quien lo oliera quedaría hechizado y no tendría más remedio que amar a la persona que lo llevara, o sea, amarle a él, Grenouille, con todo su corazón'
          'Nada hay en el mundo, ni hombre ni diablo ni cosa alguna, que sea para mí tan sospechoso como el amor, pues éste penetra en el alma más que cualquier otra cosa. Nada hay que ocupe y ate más al corazón que el amor. Por eso, cuando no dispone de armas para gobernarse, el alma se hunde, por el amor, en la más honda de las ruinas'
          'Amor y deseo son dos cosas diferentes; que no todo lo que se ama se desea, ni todo lo que se desea se ama',
      'Labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Tengo esperanza o podría no vivir',
      'Luchar hasta el último aliento',
      'Sea un hombre o sea más que un hombre. Sea firme con su propósito y firme como una piedra ',
    ];
    final random = Random();
    final quoteChoosen = listOfQuotes[random.nextInt(listOfQuotes.length)];

    return Container(
      //color: Colors.blue[200],
      height: 220,
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
                    quoteChoosen,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
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

  recordAndAnotherQuoteButtons(context) {
    List<String> listOfQuotes = [
      'Sobre la montaña florida sueltan los caballos en el cielo otoñal',
      'Yo soñaba cada día poder alcanzar la playa',
      'El misterio de la vida no es un problema a resolver, sino una realidad a experimentar',
      'Estar solo no tiene nada que ver con cuantas personas hay alrededor',
      'El hombre débil se vuelve fuerte cuando no tiene nada, porque sólo entonces puede sentir la locura de la desesperación',
      'Mientras el corazón late, mientras el cuerpo y alma siguen juntos, no puedo admitir que cualquier criatura dotada de voluntad tiene necesidad de perder la esperanza en la vida'
          'Cada libro, cada volumen que ves aquí, tiene un alma. El alma de la persona que lo escribió y de aquellos que lo leyeron, vivieron y soñaron con él. Cada vez que un libro cambia de manos, cada vez que alguien baja sus ojos a las páginas, su espíritu crece y se fortalece',
      'Mi consejo es: nunca hagas mañana lo que puedes hacer hoy. La procrastinación es la ladrona del tiempo',
      'Conseguir lo que quieres es tan difícil como no conseguir lo que quieres. Porque entonces tienes que averiguar qué hacer con ello, en lugar de averiguar qué hacer sin ello.',
      'Crearía un perfume que no sólo fuera humano, sino sobrehumano. Un aroma de ángel, tan indescriptiblemente bueno y pletórico de vigor que quien lo oliera quedaría hechizado y no tendría más remedio que amar a la persona que lo llevara, o sea, amarle a él, Grenouille, con todo su corazón'
          'Nada hay en el mundo, ni hombre ni diablo ni cosa alguna, que sea para mí tan sospechoso como el amor, pues éste penetra en el alma más que cualquier otra cosa. Nada hay que ocupe y ate más al corazón que el amor. Por eso, cuando no dispone de armas para gobernarse, el alma se hunde, por el amor, en la más honda de las ruinas'
          'Amor y deseo son dos cosas diferentes; que no todo lo que se ama se desea, ni todo lo que se desea se ama',
      'Labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Tengo esperanza o podría no vivir',
      'Luchar hasta el último aliento',
      'Sea un hombre o sea más que un hombre. Sea firme con su propósito y firme como una piedra ',
    ];
    final random = Random();
    final quoteChoosen = listOfQuotes[random.nextInt(listOfQuotes.length)];
    return Container(
      //color: Colors.green,
      height: 180,
      child: Column(
        children: [
          buildSingleButton(
            stepsTitle: 'GRABAR',
            stepsIcon: Icons.videocam_outlined,
            stepsOnClicked: pickVideoFromCamera,
            stepsColor: Color(0xff833F4C),
            stepsAvatarColor: Color(0xff833F4C),
          ),
          SizedBox(height: 25),
          buildSingleButton(
            stepsTitle: 'OBTENER OTRA FRASE',
            stepsIcon: Icons.format_quote,
            stepsOnClicked: () => setState(() {
              quoteChoosen;
            }),
            stepsColor: Color(0xff833F4C),
            stepsAvatarColor: Color(0xff833F4C),
          ),
        ],
      ),
    );
  }

  Widget buildSingleButton({
    required String stepsTitle,
    required IconData stepsIcon,
    required VoidCallback stepsOnClicked,
    required Color stepsColor,
    required Color stepsAvatarColor,
  }) =>
      Container(
        height: 55,
        margin: EdgeInsets.symmetric(horizontal: 5),
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
}
