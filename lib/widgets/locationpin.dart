import 'package:flutter/material.dart';

//dette er den røde pinnen oppe i høyre hjørne som jeg har lagt inn knapp funksjon på
//her kan du prøve å legge inn funksjonen fra google maps som gjør at ved trykk på
//pinnen så sentreres kartet
class LocationPin extends StatelessWidget {
  final VoidCallback onPressed;

  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  const LocationPin({Key? key, Key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.asset('lib/images/location.png',
            color: const Color.fromARGB(255, 230, 54, 27)),
        onPressed: () {
          Navigator.pushNamed(context,
              '/'); //"/" brukes til å fjerne ruter fra stabelen til den når hjemmesiden
        });
  }
}
