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
    );
  }
}
