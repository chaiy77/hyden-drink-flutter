import 'package:flutter/material.dart';

class WaitingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            body:
                Stack(children: [Center(child: CircularProgressIndicator())])));
  }
}
