import 'package:flutter/material.dart';

class MensajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final mensaje = ModalRoute.of(context).settings.arguments; 

    return Scaffold(
      appBar: AppBar(
        title: Text("Mensajes Page"),
      ),
      body: Center(
        child: Text(mensaje),
      ),
    );
  }
}
