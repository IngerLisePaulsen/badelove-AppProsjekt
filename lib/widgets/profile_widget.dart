import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    //henter vi primærfargen fra temaet som brukes i appen. Dette gir oss tilgang til den primære fargen som er angitt i temaet, og vi lagrer den i variabelen color

    return Center(
      child: Stack(
        //widget som plasserer sine barn i en stack, dvs. oppå hverandre. Dette lar oss plassere flere widgeter på samme plassering i UI-en
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            // angir hvor ikonet skal plaseres
            right: 4,
            child: buildEditIcon(color),
            //funksjon som bygger og returnerer en ikon-widget for redigering basert på color-variabelen som ble hentet fra temaet tidligere. Dette ikonet vil bli plassert som det øverste barnet i Stack
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    //oppretter et sirkulært bilde med en "splash" effekt når det blir trykket på
    final image = NetworkImage(imagePath);
    //oppretter en bildeinstans som kan lastes fra en nettadresse

    return ClipOval(
      //beskjærer barna til en sirkulær form
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          //viser et bilde og legger til en "splash" effekt rundt det når det blir trykket på
          image: image,
          // angir bildet som skal vises
          fit: BoxFit.cover,
          // angir hvordan bildet skal tilpasses innenfor widgeten - dekke hele uten å miste proporsjonene, men kan klippes for å fylle hele området
          width: 170,
          // angir størrelsen på Ink.image
          height: 170,
          child: InkWell(onTap: onClicked),
          // ngir vi at Ink.image skal være trykkbart, og når det blir trykket på, vil onClicked-funksjonen bli kalt
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: const Color.fromARGB(255, 220, 216, 209),
        // angir fargen til den ytterste sirkelen
        all: 3,
        // angir at padding rundt ikonet skal være 3 piksler på alle sider
        child: buildCircle(
          //oppretter en sirkel rundt pen-ikonet med fargen angitt under
          color: const Color.fromARGB(255, 133, 151, 255),
          all: 8,
          // angir at padding rundt ikonet skal være 8 piksler på alle sider
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            // selve ikonet som vises i den indre sirkelen
            color: const Color.fromARGB(255, 220, 216, 209),
            size: 20,
            // angir størrelsen på ikonet
          ),
        ),
      );

  Widget buildCircle({
    //legger til en sirkel mellom pen-ikonet og profilbildet, skaper mellomrom
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
