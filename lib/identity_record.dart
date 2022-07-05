import 'package:flutter/material.dart';
import 'package:flutter_set_of_decorated_cards/identity_verification.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class IdentityRecord extends StatefulWidget {
  File? cameraVideo;
  IdentityRecord({Key? key, required this.cameraVideo}) : super(key: key);

  @override
  State<IdentityRecord> createState() => _IdentityRecordState();
}

class _IdentityRecordState extends State<IdentityRecord> {
  VideoPlayerController? cameraVideoPlayerController;

  @override
  void initState() {
    cameraVideoPlayerController =
        VideoPlayerController.file(widget.cameraVideo!)
          ..initialize().then((_) {
            setState(() {});
            cameraVideoPlayerController?.play();
          });
  }

  @override
  Widget build(BuildContext context) {
    IdentityVerification identityVerification = IdentityVerification();
    return Scaffold(
      appBar: AppBar(
        title: Text('Revisión de Identidad'),
        centerTitle: true,
        backgroundColor: Color(0xff731F3E),
      ),
      body: recordIdentityPage(context),
    );
  }

  Widget recordIdentityPage(context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            recordIndicationsText(context),
            spaceForVideo(context),
            spaceForRecordingButtons(context),
          ],
        ),
      ),
    );
  }

  recordIndicationsText(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(width: 3.0, color: Color(0xff833F4C)),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 18, right: 3, top: 15, bottom: 15),
        child: Container(
            margin: EdgeInsets.only(right: 18),
            child: Column(
              children: [
                Text(
                  'Valida que el video sea claro y la frase se escuche correctamente.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: 18),
                Text(
                  'Puedes repetir la grabación del video, en caso contrario pulsa el botón continuar.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
              ],
            )),
      ),
    );
  }

  spaceForVideo(context) {
    //IdentityVerification identityVerification = IdentityVerification();

    return Container(
      //color: Colors.green[200],
      //height: MediaQuery.of(context).size.height * 0.32,
      child: Container(
        //color: Colors.blueGrey[100],
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          children: [
            if (widget.cameraVideo != null)
              cameraVideoPlayerController!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio:
                          cameraVideoPlayerController!.value.aspectRatio,
                      child: VideoPlayer(cameraVideoPlayerController!),
                    )
                  : Container()
            else
              Text(
                "Click on Pick Video to select video",
                style: TextStyle(fontSize: 18.0),
              ),
            Container(),
          ],
        ),
      ),
    );
  }

  Widget spaceForRecordingButtons(context) {
    return Container(
      height: 160,
      //color: Colors.green[200],
      child: Column(
        children: [
          buildButton(
              stepsTitle: 'Continuar',
              stepsIcon: Icons.check_box_outlined,
              stepsOnClicked: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => IdentityVerification(),
                    ),
                  ),
              stepsColor: Color(0xff833F4C)),
          SizedBox(height: 15),
          buildButton(
              stepsTitle: 'Repetir',
              stepsIcon: Icons.check_box_outlined,
              stepsOnClicked: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => IdentityVerification(),
                    ),
                  ),
              stepsColor: Color(0xff833F4C)),
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
                style: TextStyle(color: Colors.white),
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
