// ignore_for_file: library_private_types_in_public_api

import 'package:badelove/beskrivelser/gamlehaugen.dart';
import 'package:badelove/beskrivelser/helleneset.dart';
import 'package:badelove/beskrivelser/marineholmen_sandstrand.dart';
import 'package:badelove/beskrivelser/sandviken_sjobad.dart';
import 'package:badelove/beskrivelser/sydnes_sjobad.dart';
import 'package:badelove/utils/beskrivelse_list.dart';
import 'package:flutter/material.dart';
import 'package:badelove/widgets/homebutton.dart';
import '../../beskrivelser/nordnes_sjobad.dart';

class Topp10 extends StatefulWidget {
  const Topp10({Key? key}) : super(key: key);

  @override
  _Topp10State createState() => _Topp10State();
}

class _Topp10State extends State<Topp10> {
  final pageList = BeskrivelseList.list;
  List<String> badeplasser = [
    '1. Helleneset',
    '2. Nordnes sjøbad',
    '3. Marineholmen',
    '4. Sydnes sjøbad',
    '5. Gamlehaugen',
    '6. Sandviken sjøbad',
    '7. Badeplass',
    '8. Badeplass',
    '9. Badeplass',
    '10. Badeplass',
  ];

  List<int> starRatings = [
    1,
    5,
    5,
    4,
    4,
    4,
    3,
    3,
    2,
    2
  ]; //legg inn ønsket stjernerating

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, //fjerner pil i venstre hjørne
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'TOPP 10',
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
      body: Container(
        alignment: Alignment.center,
        child: Align(
          alignment: Alignment.center,
          child: ListView.builder(
            itemCount: pageList.length,
            itemBuilder: (context, int index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  // MaterialPageRoute(
                  // builde: (context) => DynamicPage(), settings: RouteSettings(argument:pageList[index])
                  // ),
                  // );
                  if (badeplasser[index] == '1. Helleneset') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Helleneset(),
                      ),
                    );
                  } else if (badeplasser[index] == '2. Nordnes sjøbad') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NordnesSjobad(),
                      ),
                    );
                  } else if (badeplasser[index] == '3. Marineholmen') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MarineholmenSandstrand(),
                      ),
                    );
                  } else if (badeplasser[index] == '3. Sydnes Sjøbad') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SydnesSjobad(),
                      ),
                    );
                  } else if (badeplasser[index] == '5. Gamlehaugen') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Gamlehaugen(),
                      ),
                    );
                  } else if (badeplasser[index] == '6. Sandviken sjøbad') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SandvikenSjobad(),
                      ),
                    );
                  }
                },
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        badeplasser[index],
                        style: const TextStyle(fontSize: 30),
                      ),
                      subtitle: Row(
                        children: List.generate(
                          starRatings[index],
                          (starIndex) => const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 94, 100, 150),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
