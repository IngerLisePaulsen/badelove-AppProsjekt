// ignore_for_file: library_private_types_in_public_api

import 'package:badelove/pages/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:badelove/widgets/homebutton.dart';

import '../models/user.dart';
import '../utils/user_preferences.dart';
import '../widgets/profile_widget.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final User user = UserPreferences.myUser;

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
              'PROFIL',
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
        body: Padding(
          padding:
              const EdgeInsets.only(top: 40), //flytter profilbilde lenger ned
          child: ListView(
            physics: const BouncingScrollPhysics(),
            // Når listen når slutten, vil den ha en sprettende animasjon for å indikere at du har nådd enden av listen
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  //trykker på pen-ikonet fører deg til å redigere profilen
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const EditProfilePage()),
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              buildName(user),
              const SizedBox(
                height: 24,
              ),
              buildAbout(
                  user), // Add this line if you want to display the about section
            ],
          ),
        ));
  }

  Widget buildName(User user) => Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Text(
              user.name, //legger til navnet til brukeren hentet fra utils/user_preferences
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Roboto',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              user.username, //legger til brukernavnet til brukeren hentet fra utils/user_preferences
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            )
          ],
        ),
      );

  Widget buildAbout(User user) => Container(
        // oppretter en Container med en kolonne av tekst for å vise brukerens biografi
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // justerer teksten i kolonnen til venstre for å sikre at biografi-overskriften og teksten i biografien er venstrejustert
          children: [
            const Text(
              'Biografi',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Roboto',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              user.about, //viser brukerens biografi hentet fra utils/user_preferences
              style: const TextStyle(
                fontSize: 18,
                height: 1.4,
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
}
