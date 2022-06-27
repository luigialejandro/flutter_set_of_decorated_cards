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
          SizedBox(
            height: 40,
          ),
          buttonsSpaceContainer(context),
          Spacer(),
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
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
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
                'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonsSpaceContainer(context) {
    return Container(
      height: 60,
      //color: Colors.green[200],
      child: buildButton(
          stepsTitle: 'Aceptar',
          stepsIcon: Icons.check_box_outlined,
          stepsOnClicked: () {},
          stepsColor: Color(0xff833F4C)),
    );
  }
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
