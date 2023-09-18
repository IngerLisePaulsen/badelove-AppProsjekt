import 'package:badelove/models/beskrivelse.dart';
import 'package:badelove/utils/beskrivelse_list.dart';
import 'package:badelove/widgets/homebutton.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DynamicPage extends StatefulWidget {
  //final Beskrivelse beskrivelse;
  //const DynamicPage({super.key, required this.beskrivelse});

  @override
  // ignore: library_private_types_in_public_api
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  @override
  Widget build(BuildContext context) {
    final beskrivelse =
        ModalRoute.of(context)!.settings.arguments as Beskrivelse;

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
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(beskrivelse.imagePath //picture
                  ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    beskrivelse.pageTitle, //legge til navn på badeplassen
                    style: const TextStyle(
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
                    child: HeartButton()
                    /* Image.asset(
                      //legger til hjertet
                      'lib/images/heart.png',
                      height: 30,
                      width: 30,
                    ) */
                    ,
                  ),
                ],
              ),
              const SizedBox(
                  height: 20), // Juster avstanden fra hjerte og tekstboksene
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  //legger til beskrivelse
                  beskrivelse.description,
                  style: const TextStyle(
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
                    for (var text in beskrivelse.bulletpoints)
                      _buildBulletPoint(text)
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
                      //beskrivelse.skyss
                      var url =
                          'https://reise.skyss.no/planner/travel-plans?${beskrivelse.skyss}';
                      //const url = 'https://www.skyss.no/';
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
                      var url =
                          'https://www.google.com/maps/place/${beskrivelse.gmaps}';
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
                      var url =
                          'https://www.google.com/maps/place/${beskrivelse.gparking}';
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

class HeartButton extends StatefulWidget {
  @override
  _HeartButtonState createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool _isFilled = false;

  void _toggleHeart() {
    setState(() {
      _isFilled = !_isFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: _isFilled ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
        color: Colors.red,
        iconSize: 35.0,
        onPressed: _toggleHeart,
      ),
    );
  }
}
