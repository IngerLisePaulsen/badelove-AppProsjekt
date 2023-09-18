// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:badelove/widgets/homebutton.dart';
import 'package:url_launcher/url_launcher.dart';

class SandvikenSjobad extends StatefulWidget {
  const SandvikenSjobad({Key? key}) : super(key: key);

  @override
  _SandvikenSjobadState createState() => _SandvikenSjobadState();
}

class _SandvikenSjobadState extends State<SandvikenSjobad> {
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
                'lib/images/sandvikensjobad.png',
              ),
              const SizedBox(
                  height: 20), // Juster avstanden fra bildet og skriften
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sandviken sjøbad', //legge til navn på badeplassen
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
                  'Sandviken sjøbad ligger ved Elsero, like ved Gamle Bergen Museum. På dette sjøbadet kan du beytte deg av både badestrand og brygge. Det er også en plen, samt en grillplass.',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    height: 1.20,
                    color: Color.fromARGB(255, 58, 61, 94),
                  ),
                ),
              ),
              const SizedBox(
                  height: 20), //avstand mellom tekstboks og punktliste
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //legger til punktlisten
                    _buildBulletPoint('Stupebrett'),
                    _buildBulletPoint('Stupetårn'),
                    _buildBulletPoint('Flytebrygge'),
                    _buildBulletPoint('Klatrevegg'),
                    _buildBulletPoint('Grillplass'),
                    _buildBulletPoint('Toalett'),
                    _buildBulletPoint('Kiosk'),
                    _buildBulletPoint('Barnevennlig'),
                    _buildBulletPoint('Liten parkeringsplass ved museet'),
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
                    //linker bil-ikon til google maps med sandviken sjøbad som destinasjon
                    onTap: () async {
                      const url =
                          'https://www.google.com/maps/place/Sandviken+sj%C3%B8bad/@60.4173279,5.3071141,432m/data=!3m2!1e3!4b1!4m6!3m5!1s0x463cfda8113d6d71:0x243be2684647fd8d!8m2!3d60.4173257!4d5.3092793!16s%2Fg%2F11g0l9gz36?entry=ttu';
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
                          'https://www.google.com/maps/search/Sandviken+sj%C3%B8bad+parkering/@60.4181926,5.3097148,64m/data=!3m1!1e3!4m6!2m5!3m4!2s60.418181,+5.310153!4m2!1d5.3101534!2d60.4181811?entry=ttu';
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
