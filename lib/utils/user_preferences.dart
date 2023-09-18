import '../models/user.dart';

class UserPreferences {
  static const myUser = User(
    imagePath:
        'https://img.freepik.com/premium-vector/cute-lion-with-swim-ring-cartoon-illustration_295036-650.jpg',
    name: 'Løven Linus',
    username: 'TheBadeLove',
    about: 'I dag skal jeg ikke bade! Ups, jeg bada!',
  );
}

//  klassen brukes til å opprette en statisk konstant User-instans kalt myUser, som inneholder informasjonen om en bruker med profilbilde, navn, brukernavn, biografi og om brukeren bruker mørk modus eller ikke
