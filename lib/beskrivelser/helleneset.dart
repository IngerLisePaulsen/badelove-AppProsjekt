// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:badelove/widgets/homebutton.dart';
import 'package:url_launcher/url_launcher.dart';

class Helleneset extends StatefulWidget {
  const Helleneset({Key? key}) : super(key: key);

  @override
  _HellenesetState createState() => _HellenesetState();
}

class _HellenesetState extends State<Helleneset> {
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
                'lib/images/helleneset.png',
              ),
              const SizedBox(
                  height: 20), // Juster avstanden fra bildet og skriften
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Helleneset', //legge til navn på badeplassen
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
                  'Helleneset ligger på Lønborg, nord for NHH. Her er det tilkomst til sjø via svaberg, sandfjære eller badestige. Det er også et barnevennlig basseng på 10x15 meter med dybde på 0,5-0,9 meter som fylles opp med sjøvann.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
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
                    _buildBulletPoint('Toalett'),
                    _buildBulletPoint('Bosspann'),
                    _buildBulletPoint('Stupebrett'),
                    _buildBulletPoint('Klatrevegg mot sjøen'),
                    _buildBulletPoint('Rullestolrampe til barnebasseng'),
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
                      const url =
                          'https://reise.skyss.no/planner/travel-plans?timetype=DEPARTURE&ts=2023-08-03T11:18:00Z&service-modes=airportbus,bus,carferry,expressbus,others,passengerboat,train,tram&min-transfer=2&walk-speed=normal&from=eyJkZXNjIjoiS3JvbnN0YWQsIEJlcmdlbiIsImlkIjoiTlNSOlN0b3BQbGFjZTozMTM3NCIsImxv%0D%0AYyI6IjYwLjM3MDY1OSw1LjM0ODE3MyIsIm1vZGVzIjpbIkxpZ2h0IHJhaWwiXSwidHlwZSI6InN0%0D%0Ab3Bncm91cCJ9&to=eyJkZXNjIjoiSGVsbGViYWtrZW4gNDUsIEJlcmdlbiIsImlkIjoiMjU2ODQzMTUxIiwibG9jIjoi%0D%0ANjAuNDM0NjU5OTA4OTAwNTY0LDUuMjgwNzEzMzk3NzMzMjUzIiwibW9kZXMiOm51bGwsInR5cGUi%0D%0AOiJhZGRyZXNzIn0%3D';
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
                    //linker bil-ikon til google maps med helleneset som destinasjon
                    onTap: () async {
                      const url =
                          'https://www.google.com/maps/place/Helleneset/@60.4349507,5.2771309,431m/data=!3m2!1e3!4b1!4m6!3m5!1s0x463cfdb26e3d4b8f:0x5f5d4708bda391d6!8m2!3d60.4349481!4d5.2797058!16s%2Fg%2F1tcxn7q1?entry=ttu';
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
                          'https://www.google.com/maps/search/helleneset+parkering/@60.4338534,5.2818148,108m/data=!3m1!1e3!4m6!2m5!3m4!2s60.434039,+5.282810!4m2!1d5.2828099!2d60.4340393?entry=ttu';
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
