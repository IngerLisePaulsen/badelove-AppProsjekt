// ignore_for_file: library_private_types_in_public_api
import 'package:badelove/utils/beskrivelse_list.dart';
import 'package:flutter/material.dart';
import 'package:badelove/widgets/homebutton.dart';
import 'dynamicPage.dart';

class DynamicTopp10 extends StatefulWidget {
  const DynamicTopp10({Key? key}) : super(key: key);

  @override
  _DynamicTopp10State createState() => _DynamicTopp10State();
}

class _DynamicTopp10State extends State<DynamicTopp10> {
  final pageList = BeskrivelseList.list;
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => DynamicPage(),
                        settings: RouteSettings(arguments: pageList[index])),
                  );
                },
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        pageList[index].pageTitle,
                        style: const TextStyle(fontSize: 30),
                      ),
                      subtitle: Row(
                        children: List.generate(
                          pageList[index].rating,
                          //starRatings[index],
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
