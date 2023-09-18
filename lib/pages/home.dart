// ignore_for_file: library_private_types_in_public_api

import 'package:badelove/pages/dynamicPages/dyn_vurdering.dart';

import 'package:flutter/material.dart';
import 'package:badelove/pages/oldPages/badeplasser.dart';
import 'package:badelove/pages/oldPages/favoritter.dart';
import 'package:badelove/pages/homepage.dart';
import 'package:badelove/pages/profil.dart';

import 'dynamicPages/dyn_badeplasser.dart';
import 'dynamicPages/dyn_favoritter.dart';
import 'dynamicPages/dyn_top10.dart';
import 'oldPages/topp10.dart';
import 'oldPages/vurdering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //denne pagen er for appbaren nederst i appen
  int currentTab = 0; // her fører jeg opp listen av alle knappene
  final List<Widget> screens = [
    const Topp10(),
    const Favoritter(),
    const Vurdering(),
    const Badeplasser(),
    const Profil()
  ];

  //denne kommandoen gjør jeg for at homepage.dart skal være den første siden som åpnes
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Homepage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                        //materialbutton representerer egenskapene til hvert ikon i appbaren
                        minWidth: 80,
                        onPressed: () {
                          setState(() {
                            currentScreen =
                                const DynamicTopp10(); //sikrer at topp10.dart er skjermen som vises ved trykk på knappen
                            currentTab = 0;
                          });
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 45,
                                child: Image.asset('lib/images/swimming.png',
                                    color: const Color.fromARGB(
                                        255, 133, 151, 255)),
                              ),
                            ])),
                    MaterialButton(
                        minWidth: 80,
                        onPressed: () {
                          setState(() {
                            //currentScreen = const Favoritter();
                            currentScreen = Dyn_favoritter();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 40,
                                child: Image.asset(
                                    'lib/images/filled.heart.png',
                                    color: const Color.fromARGB(
                                        255, 133, 151, 255)),
                              ),
                            ])),
                    MaterialButton(
                        minWidth: 80,
                        onPressed: () {
                          setState(() {
                            currentScreen = DynVurdering();
                            currentTab = 2;
                          });
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 33,
                                child: Image.asset('lib/images/pen.png',
                                    color: const Color.fromARGB(
                                        255, 133, 151, 255)),
                              ),
                            ])),
                    MaterialButton(
                        minWidth: 80,
                        onPressed: () {
                          setState(() {
                            currentScreen = const Dyn_badeplasser();
                            currentTab = 3;
                          });
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 35,
                                child: Image.asset('lib/images/ladder.png',
                                    color: const Color.fromARGB(
                                        255, 133, 151, 255)),
                              ),
                            ])),
                    MaterialButton(
                        minWidth: 50,
                        onPressed: () {
                          setState(() {
                            currentScreen = const Profil();
                            currentTab = 4;
                          });
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 35,
                                child: Image.asset('lib/images/user.png',
                                    color: const Color.fromARGB(
                                        255, 133, 151, 255)),
                              ),
                            ]))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
