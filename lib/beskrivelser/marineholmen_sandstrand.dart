// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:badelove/widgets/homebutton.dart';
import 'package:url_launcher/url_launcher.dart';

class MarineholmenSandstrand extends StatefulWidget {
  const MarineholmenSandstrand({Key? key}) : super(key: key);

  @override
  _MarineholmenSandstrandState createState() => _MarineholmenSandstrandState();
}

class _MarineholmenSandstrandState extends State<MarineholmenSandstrand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 94, 100, 150)),
        automaticallyImplyLeading: true,
        actions: [
          HomeButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, '/'); //går tilbake til hovedrute homepage
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        //mulighet for å scrolle
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //sentrere bildet
            children: [
              Image.asset(
                //legge til bilde
                'lib/images/marineholmen.png',
              ),
              const SizedBox(
                  height: 20), // Juster avstanden fra bildet og skriften
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Marineholmen Sandstrand', //legge til navn på badeplassen
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                      width: 8), // Juster avstanden mellom tekst og hjerte
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.red,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      //legger til hjertet
                      'lib/images/heart.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                  height: 20), // Juster avstanden fra hjerte og tekstboksene
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  //legger til beskrivelse
                  'Marineholmen Sandstrand er en menneskapt sandstrand som passer til småbarnsfamilier så vel som studentene i området.',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    height: 1.20,
                    color: Color.fromARGB(255, 58, 61, 94),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //avstand mellom tekstboks og punktliste
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //legger til punktlisten
                    _buildBulletPoint('Bord og benker'),
                    _buildBulletPoint('Bosspann'),
                    _buildBulletPoint('Stupebrett'),
                    _buildBulletPoint('Rullestolvennlig'),
                    _buildBulletPoint('Parkeringsplasser'),
                  ],
                ),
              ),
              const SizedBox(height: 20), //avstand fra tekstboks til ikon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    //linker buss-ikon til skyss
                    onTap: () async {
                      const url = 'https://www.skyss.no/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: const Column(
                      children: [
                        Icon(
                          //legger til buss-ikon
                          Icons.directions_bus_rounded,
                          size: 80,
                          color: Color.fromARGB(255, 58, 61, 94),
                        ),
                        Text('Kollektiv'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 25),
                  GestureDetector(
                    //linker bil-ikon til google maps med marineholmen sandstrand som destinasjon
                    onTap: () async {
                      const url =
                          'https://www.google.com/maps/place/Marineholmen+Sandstrand/@60.3819839,5.3228911,432m/data=!3m2!1e3!4b1!4m6!3m5!1s0x463cf9de2aa63b9b:0xfa3ac88ffc1fa3a4!8m2!3d60.3819813!4d5.325466!16s%2Fg%2F11g1rjddt_?entry=ttu';
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: const Column(
                      children: [
                        Icon(
                          //legger til bil-ikon
                          Icons.directions_car_rounded,
                          size: 80,
                          color: Color.fromARGB(255, 58, 61, 94),
                        ),
                        Text('Google Maps'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 25),
                  GestureDetector(
                    //linker P-ikon til parkering i nærheten av badeplassen
                    onTap: () async {
                      const url =
                          'https://www.google.com/maps/place/Parkering+ved+stranden/@60.381686,5.325221,91m/data=!3m1!1e3!4m14!1m7!2m6!1smarineholmen+sandstrand+parkering!3m4!2s60.382898,+5.326624!4m2!1d5.3266242!2d60.3828975!3m5!1s0x463cf9c3cbdf3207:0x7dd8169266402fd0!8m2!3d60.3816859!4d5.3257785!16s%2Fg%2F11scyrm169?entry=ttu';
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: const Column(
                      children: [
                        Icon(
                          //legger til P-ikon
                          Icons.local_parking,
                          size: 80,
                          color: Color.fromARGB(255, 58, 61, 94),
                        ),
                        Text('Parkering'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              //justerer mellomrom mellom appbaren nede som ikonene
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildBulletPoint(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        //legger til punktene i punktlisten
        '• ',
        style: TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 58, 61, 94),
        ),
      ),
      Flexible(
        child: Text(
          text, //setter teksttype, tekststørrelse, linjeavstand og farge for punktlisten
          style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              height: 1.50,
              color: Color.fromARGB(255, 58, 61, 94)),
        ),
      ),
    ],
  );
}
