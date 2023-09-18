// ignore_for_file: library_private_types_in_public_api

import 'package:badelove/pages/dynamicPages/dynamicPage.dart';
import 'package:badelove/utils/beskrivelse_list.dart';
import 'package:flutter/material.dart';
import 'package:badelove/widgets/homebutton.dart';

class Dyn_badeplasser extends StatefulWidget {
  const Dyn_badeplasser({super.key});

  @override
  _Dyn_badeplasserState createState() => _Dyn_badeplasserState();
}

class _Dyn_badeplasserState extends State<Dyn_badeplasser> {
  //final Beskrivelse beskrivelse = BeskrivelseList.list[0];
  final pageList = BeskrivelseList.list;

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
            'BADEPLASSER',
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
      body: ListView.builder(
          itemCount: pageList.length,
          itemBuilder: (context, int index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    //lager en kobling mellom bildet på Favorittsiden og badeplassen
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          //change happended here !
                          builder: (context) => DynamicPage(),
                          settings: RouteSettings(arguments: pageList[index])),
                    );
                  },
                  child: Image.asset(
                    // legger til bilde
                    pageList[index].imagePath,
                    width: 500,
                    height: 250,
                  ),
                ),
                SizedBox(
                  width: 500,
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      //legger til en beskrivende tekst under bildet
                      pageList[index].pageTitle,
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
