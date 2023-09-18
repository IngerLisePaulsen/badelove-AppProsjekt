// ignore_for_file: library_private_types_in_public_api

import 'package:badelove/beskrivelser/gamlehaugen.dart';
import 'package:badelove/beskrivelser/helleneset.dart';
import 'package:badelove/beskrivelser/marineholmen_sandstrand.dart';
import 'package:badelove/beskrivelser/nordnes_sjobad.dart';
import 'package:badelove/beskrivelser/sandviken_sjobad.dart';
import 'package:badelove/beskrivelser/sydnes_sjobad.dart';
import 'package:flutter/material.dart';
import 'package:badelove/widgets/homebutton.dart';

class Favoritter extends StatefulWidget {
  const Favoritter({super.key});

  @override
  _FavoritterState createState() => _FavoritterState();
}

class _FavoritterState extends State<Favoritter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Favoritter',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Roboto',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          HomeButton(onPressed: () {
            Navigator.pushNamed(context, '/');
          }),
        ],
      ),
      body: SingleChildScrollView(
        // rullbar visning av innholdet sitt når innholdet ikke får plass på skjermen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                //lager en kobling mellom bildet på Favorittsiden og Hellenesetsiden
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Helleneset(),
                  ),
                );
              },
              child: Image.asset(
                // legger til bilde
                'lib/images/helleneset.png',
                width: 500,
                height: 250,
              ),
            ),
            const SizedBox(
              width: 500,
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  //legger til en beskrivende tekst under bildet
                  'Helleneset',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //lager en kobling mellom bildet på Favorittsiden og Gamlehaugensiden
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Gamlehaugen(),
                  ),
                );
              },
              child: Image.asset(
                //legger til bilde
                'lib/images/gamlehaugen.jpg',
                width: 500,
                height: 250,
              ),
            ),
            const SizedBox(
              width: 500,
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  //legger til en beskrivende tekst under bildet
                  'Gamlehaugen',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //lager en kobling mellom bildet på Favorittsiden og Marineholmensiden
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MarineholmenSandstrand(),
                  ),
                );
              },
              child: Image.asset(
                //legger til bilde
                'lib/images/marineholmen.png',
                width: 500,
                height: 250,
              ),
            ),
            const SizedBox(
              width: 500,
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  // //legger til en beskrivende tekst under bildet
                  'Marineholmen Sandstrand',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //lager en kobling mellom bildet på Favorittsiden og Nordnessiden
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NordnesSjobad(),
                  ),
                );
              },
              child: Image.asset(
                //legger til bilde
                'lib/images/nordnessjobad.png',
                width: 500,
                height: 250,
              ),
            ),
            const SizedBox(
              width: 500,
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  //legger til en beskrivende tekst under bildet
                  'Nordnes Sjøbad',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //lager en kobling mellom bildet på Favorittsiden og Sandvikensiden
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SandvikenSjobad(),
                  ),
                );
              },
              child: Image.asset(
                //legger til bilde
                'lib/images/sandvikensjobad.png',
                width: 500,
                height: 250,
              ),
            ),
            const SizedBox(
              width: 500,
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  //legger til en beskrivende tekst under bildet
                  'Sandviken Sjøbad',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //lager en kobling mellom bildet på Favorittsiden og Sydnessiden
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SydnesSjobad(),
                  ),
                );
              },
              child: Image.asset(
                //legger til bilde
                'lib/images/sydnessjobad.png',
                width: 500,
                height: 250,
              ),
            ),
            const SizedBox(
              width: 500,
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  //legger til en beskrivende tekst under bildet
                  'Sydnes Sjøbad',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
