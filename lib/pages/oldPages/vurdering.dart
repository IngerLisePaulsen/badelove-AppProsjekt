// ignore_for_file: library_private_types_in_public_api

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:badelove/widgets/homebutton.dart';

class Vurdering extends StatefulWidget {
  const Vurdering({Key? key}) : super(key: key);

  @override
  _VurderingState createState() => _VurderingState();
}

class _VurderingState extends State<Vurdering> {
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
                'VURDERING',
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
        ]));
  }
}

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final List<String> items = [
    'Gamlehaugen',
    'Helleneset',
    'Marineholmen Sandstrand',
    'Nordnes Sjøbad',
    'Sandviken Sjøbad',
    'Sydnes Sjøbad',
  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    final List<DropdownMenuItem<String>> menuItems = [];
    for (final String item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              'Velg badeplass',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: _addDividersAfterItems(items),
            value: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
              });
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 140,
            ),
            dropdownStyleData: const DropdownStyleData(
              maxHeight: 200,
            ),
            menuItemStyleData: MenuItemStyleData(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              customHeights: _getCustomItemsHeights(),
            ),
            iconStyleData: const IconStyleData(
              openMenuIcon: Icon(Icons.arrow_drop_up),
            ),
          ),
        ),
      ),
    );
  }
}
