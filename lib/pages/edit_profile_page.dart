import 'dart:io';

import 'package:badelove/utils/user_preferences.dart';
import 'package:badelove/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../models/user.dart';
import '../widgets/homebutton.dart';
import '../widgets/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;
  File? _pickedImage;

  void _pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        this._pickedImage = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  //ansvarlig for å velge et bilde fra galleriet, lagre det permanent og oppdatere brukergrensesnittet med det valgte bildet

  void _pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        this._pickedImage = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  //gjør det mulig for brukeren å ta et bilde med kameraet, lagre det permanent og oppdatere brukergrensesnittet med det tatte bildet

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }
  //funksjonen tar et bilde på en midlertidig sti (imagePath), kopierer det til applikasjonens dokumenter-katalog, og returnerer en Future<File> som representerer den permanente filen

  void _saveProfileChanges() async {
    // Save the changes made to the user's profile here, for example, updating the database
    // with the new user information including the new profile image path (_pickedImage?.path).
    // For demonstration purposes, let's just print the profile details here.
    print('Full Name: ${user.name}');
    print('Username: ${user.username}');
    print('Biography: ${user.about}');
    if (_pickedImage != null) {
      print('Profile Image Path: ${_pickedImage!.path}');
      // In this example, we can update the UserPreferences with the new profile image path.
      user = user.copyWith(imagePath: _pickedImage!.path);
      //UserPreferences.saveUser(user);
    }

    // You can add your own logic here to save the changes to your database.
    // For the demonstration, we are updating the UserPreferences.myUser here.
    // In your actual implementation, you should update the user information
    // in your database or shared preferences.
  }

  // Dummy function for the onClicked parameter in ProfileWidget
  void _dummyFunction() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 94, 100, 150)),
        automaticallyImplyLeading: true,
        //legger til tilbakepil på Edit Profile
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Roboto',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          HomeButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              physics: const BouncingScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: () async {
                    // Show a bottom sheet to choose the image source
                    await showModalBottomSheet(
                      context: context,
                      builder: (context) => ImagePickerApp(
                        onImagePicked: (imagePath) async {
                          final imagePermanent =
                              await saveFilePermanently(imagePath);
                          setState(() {
                            this._pickedImage = imagePermanent;
//Når brukeren trykker på GestureDetector, vil den vise et bunnark for å velge bildekilden (fra galleriet eller kameraet). Etter å ha valgt et bilde, vil den permanente filen av bildet bli lagret og deretter oppdatert i tilstanden for å vise bildet
                          });
                        },
                      ),
                    );
                  },
                  child: ProfileWidget(
                    imagePath: _pickedImage != null
                        ? _pickedImage!.path
                        : user.imagePath,
                    isEdit: true,
                    onClicked:
                        _dummyFunction, // Provide the dummy function here
                  ),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Fullt navn',
                  text: user.name,
                  onChanged: (String name) {
                    setState(() {
                      user = user.copyWith(name: name);
                    });
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Brukernavn',
                  text: user.username,
                  onChanged: (String username) {
                    setState(() {
                      user = user.copyWith(username: username);
                    });
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Biografi',
                  text: user.about,
                  maxLines: 5,
                  onChanged: (String about) {
                    setState(() {
                      user = user.copyWith(about: about);
                    });
                  },
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _saveProfileChanges,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 133, 151, 255),
            ), //lagreknappen
            child: const Text('Save Changes'),
          ),
        ],
      ),
    );
  }
}

class ImagePickerApp extends StatelessWidget {
  final Function(String imagePath) onImagePicked;

  const ImagePickerApp({Key? key, required this.onImagePicked})
      : super(key: key);

  void getImage(ImageSource source, BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      onImagePicked(image.path);
      Navigator.pop(context); // Close the bottom sheet after picking an image
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  //Generelt gjør ImagePickerApp-klassen det mulig å vise et grensesnitt for å velge bildet fra galleriet eller kameraet, og når brukeren har valgt et bilde, vil den permanente stien til det valgte bildet bli returnert til den funksjonen som ble gitt som onImagePicked-parameteren

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('Velg fra kamerarull'),
          leading: const Icon(Icons.image_outlined),
          onTap: () => getImage(ImageSource.gallery, context),
        ),
        ListTile(
          title: const Text('Velg fra kamera'),
          leading: const Icon(Icons.camera),
          onTap: () => getImage(ImageSource.camera, context),
        ),
//denne delen av koden vil vise et grensesnitt som gir brukeren to alternativer for å velge et bilde: enten fra kamerarullen (galleri) eller fra kameraet. Når brukeren trykker på et av disse alternativene, vil den tilknyttede getImage-funksjonen bli kalt, som videre tar seg av bildevalget og behandlingen av den permanente stien til bildet
      ],
    );
  }
}
