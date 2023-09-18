import 'package:badelove/widgets/homebutton.dart';
import 'package:flutter/material.dart';

class DynVurdering extends StatefulWidget {
  @override
  _DynVurderingState createState() => _DynVurderingState();
}

class _DynVurderingState extends State<DynVurdering> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'VURDERING',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Roboto',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 94, 100, 150)),
        automaticallyImplyLeading: false,
        actions: [
          HomeButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
