class User {
  final String imagePath;
  //en streng som inneholder banen til brukerens profilbilde. Denne banen peker vanligvis på en nettadresse (URL) eller en lokal filbane til brukerens profilbilde
  final String name;
  //en streng som inneholder brukerens fulle navn
  final String username;
  //en streng som inneholder brukerens brukernavn (brukernavnet er ofte unikt og brukes for å identifisere brukeren)
  final String about;
  //en streng som inneholder en kort biografi eller beskrivelse av brukeren

  const User({
    required this.imagePath,
    required this.name,
    required this.username,
    required this.about,
  });

  User copyWith({
    String? name,
    String? username,
    String? about,
    String? imagePath,
  }) {
    return User(
      name: name ?? this.name,
      username: username ?? this.username,
      about: about ?? this.about,
      imagePath: imagePath ?? this.imagePath,
    );
  }
//Samlet sett gjør copyWith-metoden det enkelt å opprette en ny User-instans med noen eller alle attributtene oppdatert. Dette kan være nyttig når du ønsker å lage kopier av eksisterende User-instanser og gjøre endringer i attributtene uten å endre den opprinnelige instansen
}
