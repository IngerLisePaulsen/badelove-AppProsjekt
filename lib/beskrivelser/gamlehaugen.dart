// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:badelove/widgets/homebutton.dart';
import 'package:url_launcher/url_launcher.dart';

class Gamlehaugen extends StatefulWidget {
  const Gamlehaugen({Key? key}) : super(key: key);

  @override
  _GamlehaugenState createState() => _GamlehaugenState();
}

class _GamlehaugenState extends State<Gamlehaugen> {
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
                'lib/images/gamlehaugen.jpg',
              ),
              const SizedBox(
                  height: 20), // Juster avstanden fra bildet og skriften
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Gamlehaugen', //legge til navn på badeplassen
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
                  'Badeplassen ligger i Konsulbukta ved Gamlehaugen. Det er tilkomst til vannet via strand og svaberg.',
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
                    _buildBulletPoint('Bord og benker'),
                    _buildBulletPoint('Toalett'),
                    _buildBulletPoint('Bosspann'),
                    _buildBulletPoint('Stupebrett'),
                    _buildBulletPoint('Flytebrygge'),
                    _buildBulletPoint('Parkering ved Gamlehaugen'),
                    _buildBulletPoint('test add')
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
                    //linker bil-ikon til google maps med gamlehaugen som destinasjon
                    onTap: () async {
                      const url =
                          'https://www.google.com/maps/place/Gamlehaugen,+5230+Bergen/@60.3420544,5.3270616,865m/data=!3m2!1e3!4b1!4m10!1m2!2m1!1sgamlehaugen+badeplass!3m6!1s0x463cf976bab79b2b:0x8930bf7c115b2fa6!8m2!3d60.3424204!4d5.3374401!15sChVnYW1sZWhhdWdlbiBiYWRlcGxhc3OSAQxuZWlnaGJvcmhvb2TgAQA!16s%2Fg%2F1tgpr5xp?entry=ttu';
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
                    //linker P-ikon til parkering i nærheten av badeplass
                    onTap: () async {
                      const url =
                          'https://www.google.com/maps/place/Gamlehaugen/@60.3428479,5.3352638,182m/data=!3m1!1e3!4m10!1m2!2m1!1sgamlehaugen+badeplass!3m6!1s0x463cf97140df1f4f:0xcb3ba5b01c02a9f3!8m2!3d60.342898!4d5.3366297!15sChVnYW1sZWhhdWdlbiBiYWRlcGxhc3NaFyIVZ2FtbGVoYXVnZW4gYmFkZXBsYXNzkgEGbXVzZXVtmgEjQ2haRFNVaE5NRzluUzBWSlEwRm5TVVJoTlU5SGRGWlJFQUXgAQA!16zL20vMGMzX3Fx?entry=ttu';
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
