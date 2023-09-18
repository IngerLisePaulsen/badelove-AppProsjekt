import 'package:badelove/models/beskrivelse.dart';

class BeskrivelseList {
  static const list = [
    Beskrivelse(
        imagePath: 'lib/images/helleneset.png',
        pageTitle: 'Helleneset',
        rating: 5,
        description:
            'Helleneset ligger på Lønborg, nord for NHH. Her er det tilkomst til sjø via svaberg, sandfjære eller badestige. Det er også et barnevennlig basseng på 10x15 meter med dybde på 0,5-0,9 meter som fylles opp med sjøvann.',
        bulletpoints: [
          "Toalett",
          "Stupebrett",
          "Bord og benker",
          "Klatrevegg mot sjøen",
          "Rullestolrampe til barnebasseng"
        ],
        skyss:
            'timetype=DEPARTURE&ts=2023-08-04T13:10:36Z&service-modes=airportbus,bus,carferry,expressbus,others,passengerboat,train,tram&min-transfer=2&walk-speed=normal&from-pos=60.3731997,5.3404917&to=eyJkZXNjIjoiSGVsbGViYWtrZW4gNDUsIEJlcmdlbiIsImxvYyI6IjYwLjQzNDY1OTkwODkwMDU2%0D%0ANCw1LjI4MDcxMzM5NzczMzI1MyIsInR5cGUiOiJhZGRyZXNzIn0%3D',
        gmaps:
            'Helleneset/@60.4349481,5.2771309,17z/data=!3m1!4b1!4m6!3m5!1s0x463cfdb26e3d4b8f:0x5f5d4708bda391d6!8m2!3d60.4349481!4d5.2797058!16s%2Fg%2F1tcxn7q1?entry=ttu',
        gparking:
            'Bergen+og+Omland+Friluftsråd/@60.4342866,5.2806689,223m/data=!3m1!1e3!4m14!1m7!3m6!1s0x463cfdb26e3d4b8f:0x5f5d4708bda391d6!2sHelleneset!8m2!3d60.4349481!4d5.2797058!16s%2Fg%2F1tcxn7q1!3m5!1s0x463cfdb25ab7b831:0xc2945363ae77896b!8m2!3d60.4346133!4d5.2808363!16s%2Fg%2F1vgw76kp?entry=ttu',
        favoritt: true),
    Beskrivelse(
        imagePath: 'lib/images/gamlehaugen.jpg',
        pageTitle: 'Gamlehaugen',
        rating: 4,
        description:
            'Badeplassen ligger i Konsulbukta ved Gamlehaugen. Det er tilkomst til vannet via strand og svaberg.',
        bulletpoints: [
          "Bord og benker",
          "Toalett",
          "Stupebrett",
          "Flytebrygge"
        ],
        skyss:
            'timetype=DEPARTURE&ts=2023-08-04T13:10:36Z&service-modes=airportbus,bus,carferry,expressbus,others,passengerboat,train,tram&min-transfer=2&walk-speed=normal&from-pos=60.3731997,5.3404917&to=eyJkZXNjIjoiR2FtbGVoYXVndmVnZW4gMTAsIEJlcmdlbiIsImlkIjoiMjU2ODc4Mzk1IiwibG9j%0D%0AIjoiNjAuMzQyODg1MTcyNjg3NjgsNS4zMzY2OTk3MDE4ODQ5MzQiLCJtb2RlcyI6bnVsbCwidHlw%0D%0AZSI6ImFkZHJlc3MifQ%3D%3D',
        gmaps:
            'Gamlehaugen/@60.342898,5.3276175,16z/data=!4m10!1m2!2m1!1sgamlehaugen!3m6!1s0x463cf97140df1f4f:0xcb3ba5b01c02a9f3!8m2!3d60.342898!4d5.3366297!15sCgtnYW1sZWhhdWdlbloNIgtnYW1sZWhhdWdlbpIBBm11c2V1beABAA!16zL20vMGMzX3Fx?entry=ttu',
        gparking:
            'Christines+Bunadservice/@60.343007,5.3339723,447m/data=!3m1!1e3!4m9!1m2!2m1!1sgamlehaugen!3m5!1s0x463cfb1ba0e88373:0xc7f8d5d245b12c89!8m2!3d60.3438997!4d5.3384915!16s%2Fg%2F11qpy7xvh2?entry=ttu',
        favoritt: false),
    Beskrivelse(
        imagePath: 'lib/images/marineholmen.png',
        pageTitle: 'Marineholmen Sandstrand',
        rating: 4,
        description:
            'Marineholmen Sandstrand er en menneskapt sandstrand som passer til småbarnsfamilier så vel som studentene i området.',
        bulletpoints: ["Bord og benker", "Stupebrett", "Rullestolvennlig"],
        skyss:
            'timetype=DEPARTURE&ts=2023-08-04T13:10:36Z&service-modes=airportbus,bus,carferry,expressbus,others,passengerboat,train,tram&min-transfer=2&walk-speed=normal&from-pos=60.3731997,5.3404917&to=eyJkZXNjIjoiTcO4aGxlbnByaXMgYmFkZXBsYXNzLCBCZXJnZW4iLCJpZCI6Ik9TTTpUb3BvZ3Jh%0D%0AcGhpY1BsYWNlOjU4NzMxMDM3NiIsImxvYyI6IjYwLjM4MTk1OTkyODY1MDY2Niw1LjMyNTU4OTA4%0D%0AODU3MTQ1MDUiLCJtb2RlcyI6bnVsbCwidHlwZSI6InBvaSJ9',
        gmaps:
            'Marineholmen+Sandstrand/@60.3819654,5.3229125,17z/data=!4m14!1m7!3m6!1s0x463cf9de2aa63b9b:0xfa3ac88ffc1fa3a4!2sMarineholmen+Sandstrand!8m2!3d60.3819813!4d5.325466!16s%2Fg%2F11g1rjddt_!3m5!1s0x463cf9de2aa63b9b:0xfa3ac88ffc1fa3a4!8m2!3d60.3819813!4d5.325466!16s%2Fg%2F11g1rjddt_?entry=ttu',
        gparking:
            'Parkering+ved+stranden/@60.3818169,5.3242054,223m/data=!3m1!1e3!4m14!1m7!3m6!1s0x463cf9de2aa63b9b:0xfa3ac88ffc1fa3a4!2sMarineholmen+Sandstrand!8m2!3d60.3819813!4d5.325466!16s%2Fg%2F11g1rjddt_!3m5!1s0x463cf9c3cbdf3207:0x7dd8169266402fd0!8m2!3d60.3816859!4d5.3257785!16s%2Fg%2F11scyrm169?entry=ttu',
        favoritt: false),
    Beskrivelse(
        imagePath: 'lib/images/nordnessjobad.png',
        pageTitle: 'Nordnes Sjøbad',
        rating: 4,
        description:
            'Nordnes Sjøbad ligger i Nordnesparken, kun et steinkast unna Akvariet og gangavstand til Bergen sentrum. Her er det et utendørs oppvarmet saltvannsbaseng på 25 meter som holder herlige 30 grader.',
        bulletpoints: [
          "Inngangbillett",
          "Bord og benker",
          "Stupebrett ut i sjøen",
          "Garderober",
          "Varm badstue",
          "Toalett"
        ],
        skyss:
            'timetype=DEPARTURE&ts=2023-08-04T13:10:36Z&service-modes=airportbus,bus,carferry,expressbus,others,passengerboat,train,tram&min-transfer=2&walk-speed=normal&from-pos=60.3731997,5.3404917&to=eyJkZXNjIjoiTm9yZG5lc3BhcmtlbiAzMCwgQmVyZ2VuIiwiaWQiOiIyNTY5NTI2MDciLCJsb2Mi%0D%0AOiI2MC4zOTkwMDY2NTc3NjgyNiw1LjMwMjU3NDA2NTI2MDYzNyIsIm1vZGVzIjpudWxsLCJ0eXBl%0D%0AIjoiYWRkcmVzcyJ9',
        gmaps:
            'Nordnes+Sjøbad/@60.3989816,5.300046,17z/data=!3m1!4b1!4m6!3m5!1s0x463cfc10fcaef8c5:0x4aa995fe862c154b!8m2!3d60.3989816!4d5.3026209!16s%2Fg%2F1tgxgncd?entry=ttu',
        gparking:
            'NordnesGarasjen/@60.3991565,5.3006682,17z/data=!4m14!1m7!3m6!1s0x463cfc10fcaef8c5:0x4aa995fe862c154b!2sNordnes+Sjøbad!8m2!3d60.3989816!4d5.3026209!16s%2Fg%2F1tgxgncd!3m5!1s0x463cfc10bcfffb39:0x893847e8dd41d9ea!8m2!3d60.3998973!4d5.3053341!16s%2Fg%2F1hc1dn4bz?entry=ttu',
        favoritt: false),
    Beskrivelse(
        imagePath: 'lib/images/sandvikensjobad.png',
        pageTitle: 'Sandviken Sjøbad',
        rating: 3,
        description:
            'Sandviken sjøbad ligger ved Elsero, like ved Gamle Bergen Museum. På dette sjøbadet kan du beytte deg av både badestrand og brygge. Det er også en plen, samt en grillplass.',
        bulletpoints: [
          "Stupebrett",
          "Stupetårn",
          "Flytebrygge",
          "Klatrevegg",
          "Grillplass",
          "Toalett",
          "Kiosk",
          "Barnevennlig"
        ],
        skyss:
            'timetype=DEPARTURE&ts=2023-08-04T13:10:36Z&service-modes=airportbus,bus,carferry,expressbus,others,passengerboat,train,tram&min-transfer=2&walk-speed=normal&from-pos=60.3731997,5.3404917&to=eyJkZXNjIjoiRWxzZXNybyA1NiwgQmVyZ2VuIiwiaWQiOiIyNTY5NzI2MDMiLCJsb2MiOiI2MC40%0D%0AMTczNTYzMzAxNTgsNS4zMDkyMTM3ODA3Mzk2NjMiLCJtb2RlcyI6bnVsbCwidHlwZSI6ImFkZHJl%0D%0Ac3MifQ%3D%3D',
        gmaps:
            'Sandviken+sjøbad/@60.4173257,5.3067044,17z/data=!3m1!4b1!4m6!3m5!1s0x463cfda8113d6d71:0x243be2684647fd8d!8m2!3d60.4173257!4d5.3092793!16s%2Fg%2F11g0l9gz36?entry=ttu',
        gparking:
            'Gamle+Bergen+Museum+-+Bymuseet+i+Bergen/@60.4182478,5.3091753,133m/data=!3m1!1e3!4m14!1m7!3m6!1s0x463cfda8113d6d71:0x243be2684647fd8d!2sSandviken+sjøbad!8m2!3d60.4173257!4d5.3092793!16s%2Fg%2F11g0l9gz36!3m5!1s0x463cf94ed8f1251f:0xcf3b9b10f99fe800!8m2!3d60.4181597!4d5.3093194!16s%2Fg%2F1tkjjsfn?entry=ttu',
        favoritt: false),
    Beskrivelse(
        imagePath: 'lib/images/sydnessjobad.png',
        pageTitle: 'Sydnes Sjøbad',
        rating: 3,
        description:
            'Sydnes Sjøbad ligger ved Hurtigruteterminalen i Jekteviken med gangavstand fra Torgalmenningen og sentrum. Her er det mulighet for å bruke både brygge og badestiger.',
        bulletpoints: ["Brygge", "Badestige"],
        skyss:
            'timetype=DEPARTURE&ts=2023-08-04T13:10:36Z&service-modes=airportbus,bus,carferry,expressbus,others,passengerboat,train,tram&min-transfer=2&walk-speed=normal&from-pos=60.3731997,5.3404917&to=eyJkZXNjIjoiUm9nbmVzbWF1ZXQiLCJpZCI6IktWRSUzQVRvcG9ncmFwaGljUGxhY2UlM0E0NjAx%0D%0ALVJvZ25lc21hdWV0IiwibG9jIjoiNjAuMzkxNjIwMTQ4OTgxNjQsNS4zMTQ5NDU5MjYzMTQ3MTki%0D%0ALCJ0eXBlIjoic3RyZWV0In0%3D',
        gmaps:
            'Sydnes+Sjøbad/@60.3931051,5.3067279,15.5z/data=!4m6!3m5!1s0x463cfd8f02d0e6a1:0x455b2ff332e59de9!8m2!3d60.3921657!4d5.313868!16s%2Fg%2F11j97vbrcx?entry=ttu',
        gparking:
            'KlosterGarasjen/@60.3926488,5.3142816,273m/data=!3m1!1e3!4m14!1m7!3m6!1s0x463cfd8f02d0e6a1:0x455b2ff332e59de9!2sSydnes+Sjøbad!8m2!3d60.3921657!4d5.313868!16s%2Fg%2F11j97vbrcx!3m5!1s0x463cfc0314f9f035:0x18d9b92d5ecff63a!8m2!3d60.3931547!4d5.3165641!16s%2Fg%2F1hc2bjkqh?entry=ttu',
        favoritt: false),
  ];
}
