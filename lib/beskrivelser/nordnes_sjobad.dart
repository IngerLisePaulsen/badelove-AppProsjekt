// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:badelove/widgets/homebutton.dart';
import 'package:url_launcher/url_launcher.dart';

class NordnesSjobad extends StatefulWidget {
  const NordnesSjobad({Key? key}) : super(key: key);

  @override
  _NordnesSjobadState createState() => _NordnesSjobadState();
}

class _NordnesSjobadState extends State<NordnesSjobad> {
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
                'lib/images/nordnessjobad.png',
              ),
              const SizedBox(
                  height: 20), // Juster avstanden fra bildet og skriften
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Nordnes sjøbad', //legge til navn på badeplassen
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
                  'Nordnes Sjøbad ligger i Nordnesparken, kun et steinkast unna Akvariet og gangavstand til Bergen sentrum. Her er det et utendørs oppvarmet saltvannsbaseng på 25 meter som holder herlige 30 grader.',
                  style: TextStyle(
                    //legger til beskrivelse
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
                    _buildBulletPoint('Inngangsbillett'),
                    _buildBulletPoint('Bord og benker'),
                    _buildBulletPoint('Bosspann'),
                    _buildBulletPoint('Stupebrett ut i sjøen'),
                    _buildBulletPoint('Garderober'),
                    _buildBulletPoint('Varm badstue'),
                    _buildBulletPoint(
                        'Parkering i Nordnesgarasjen eller sentrum'),
                    _buildBulletPoint('Buss eller sykkel'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //avstand fra tekstboks til ikon
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
                    //linker bil-ikon til google maps med nordnes sjøbad som destinasjon
                    onTap: () async {
                      const url =
                          'https://www.google.com/maps/place/Nordnes+Sj%C3%B8bad/@60.3989816,5.300046,17z/data=!3m1!4b1!4m6!3m5!1s0x463cfc10fcaef8c5:0x4aa995fe862c154b!8m2!3d60.3989816!4d5.3026209!16s%2Fg%2F1tgxgncd?entry=ttu';
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
                          'https://www.google.com/maps/place/NordnesGarasjen/@60.3994786,5.3030059,432m/data=!3m1!1e3!4m14!1m7!3m6!1s0x463cfc10bcfffb39:0x893847e8dd41d9ea!2sNordnesGarasjen!8m2!3d60.3998973!4d5.3053341!16s%2Fg%2F1hc1dn4bz!3m5!1s0x463cfc10bcfffb39:0x893847e8dd41d9ea!8m2!3d60.3998973!4d5.3053341!16s%2Fg%2F1hc1dn4bz?entry=ttu';
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
