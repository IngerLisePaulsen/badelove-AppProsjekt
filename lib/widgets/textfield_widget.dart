import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({
    Key? key,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;
  //Denne kontrolleren vil hjelpe oss med å håndtere teksten som vises i tekstfeltet

  @override
  void initState() {
    //metode som kalles når tilstanden blir opprettet. Her overskriver vi den for å initialisere controller med den initielle teksten som er gitt til TextFieldWidget. Dette sikrer at når widgeten blir opprettet, vil tekstfeltet ha den riktige initielle teksten
    super.initState();
    //kaller super.initState() for å kjøre den opprinnelige initState-metoden som finnes i overordnet klasse (State). Dette er viktig for å sikre at den opprinnelige oppstartsmetoden blir kjørt
    controller = TextEditingController(text: widget.text);
    //sikrer at tekstfeltet vil ha riktig initiell tekst når det blir opprettet
  }

  @override
  void dispose() {
    // kalles når tilstanden blir fjernet. Her overskriver vi den for å sørge for at controller blir fjernet korrekt for å unngå minnelekkasjer
    controller.dispose();
    //kaller dispose() på controller for å frigjøre ressurser og fjerne kontrolleren når tilstanden blir fjernet
    super.dispose();
    //kaller super.dispose() for å kjøre den opprinnelige dispose-metoden som finnes i overordnet klasse (State). Dette er viktig for å sikre at den opprinnelige dispose-metoden blir kjørt
  }

  @override
  Widget build(BuildContext contest) => Column(
        //alle barnene til Column vil være plassert under hverandre i den rekkefølgen de er oppgitt
        crossAxisAlignment: CrossAxisAlignment.start,
        //alle barnene skal justeres til venstre (starten) i kryssaksen
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 30,
              fontFamily: 'Roboto',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              //legger til rammen rundt tekstboksene på redigeringssiden
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            maxLines: widget.maxLines,
          ),
        ],
      );
}
