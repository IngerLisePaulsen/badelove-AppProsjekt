import 'package:flutter/material.dart';

//her er hjemknappen som jeg legger inn som widget i alle pages utenom homepage.dart
class HomeButton extends StatelessWidget {
  final VoidCallback onPressed;

  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  const HomeButton({Key? key, Key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: IconButton(
        icon: Image.asset(
          'lib/images/home.png',
          color: const Color.fromARGB(255, 133, 151, 255),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
    );
  }
}
