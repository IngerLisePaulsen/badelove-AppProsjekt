// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:badelove/widgets/homebutton.dart';
import 'package:url_launcher/url_launcher.dart';

class SydnesSjobad extends StatefulWidget {
  const SydnesSjobad({Key? key}) : super(key: key);

  @override
  _SydnesSjobadState createState() => _SydnesSjobadState();
}

class _SydnesSjobadState extends State<SydnesSjobad> {
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
                'lib/images/sydnessjobad.png',
              ),
              const SizedBox(
                height: 20,
              ), // Juster avstanden fra bildet og skriften
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sydnes sjøbad', //legge til navn på badeplassen
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
                  'Sydnes Sjøbad ligger ved Hurtigruteterminalen i Jekteviken med gangavstand fra Torgalmenningen og sentrum. Her er det mulighet for å bruke både brygge og badestiger.',
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
                    _buildBulletPoint('Brygge'),
                    _buildBulletPoint('Badestige'),
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
                    //linker bil-ikon til google maps med sydnes sjøbad som destinasjon
                    onTap: () async {
                      const url =
                          'https://www.google.com/maps/place/Sydnes+Sj%C3%B8bad/@60.3921657,5.3112931,17z/data=!3m1!4b1!4m6!3m5!1s0x463cfd8f02d0e6a1:0x455b2ff332e59de9!8m2!3d60.3921657!4d5.313868!16s%2Fg%2F11j97vbrcx?entry=ttu';
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
                          'https://www.google.com/maps/place/Bergen+Havn+N%C3%B8stetorget+(Jekteviken)/@60.3918396,5.3124895,257m/data=!3m1!1e3!4m14!1m7!3m6!1s0x463cfd8f02d0e6a1:0x455b2ff332e59de9!2sSydnes+Sj%C3%B8bad!8m2!3d60.3921657!4d5.313868!16s%2Fg%2F11j97vbrcx!3m5!1s0x463cfc047a202317:0x56f1f224a7efac0c!8m2!3d60.3914412!4d5.3131741!16s%2Fg%2F11dzd4g46b?entry=ttu';
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
