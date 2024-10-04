import 'package:cloud_firestore/cloud_firestore.dart';

class Album{
  String albumName;
  String artist;
  String description;
  String imgURL;
  int year;
  String albumId;

Album({
  required this.albumName,
  required this.artist,
  required this.description,
  required this.imgURL,
  required this.year,
  required this.albumId,
});

  Map<String, dynamic> toFirestore() {
    return {
      'albumName': albumName,
      'artist': artist,
      'description': description,
      'imgURL': imgURL,
      'year': year,
      'albumId': albumId,
    };
  }

  static Album fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return Album(
      albumName: data?['albumName'],
      artist: data?['artist'],
      description: data?['description'],
      imgURL: data?['imgURL'],
      year: data?['year'],
      albumId: data?['albumId'],
    );
  }

}

/*
ALBUMS ORIGINALES:

Album(
  albumName:'Canciones del Huracán',
  artist:'Tan Biónica',
  year: 2007,
  imgURL: 'https://www.cmtv.com.ar/tapas-cd/tanbionicahuracan.webp',
  description: 'Canciones del huracán es el primer álbum de estudio del grupo musical Tan Biónica. Fue grabado entre 2006 y 2007, y fue reeditado en 2009 junto con la reproducción extendida titulada Wonderful noches. El álbum se plantea mucho más rockero que su predecesor, con constante presencia de guitarras eléctricas, ritmos frenéticos y una mayor potencia en la voz del vocalista. Las letras en la mayoría de las canciones del álbum parecen hablar acerca del consumo de narcóticos y las consecuencias que esto deja mediante metáforas, pero también toca otros temas como el amor, desamor y la depresión. Canciones como “La depresión” y “Chica biónica” parecen hablar sobre una mujer cuya adicción a las drogas la destroza y la vuelca hacia un estado depresivo, del cual solo parece escapar consumiendo más narcóticos. Mientras tanto, canciones como “Vinidy Swing” y “Mis madrugaditas” hablan sobre festejar sin motivo aparente (“…hoy quiero festejar que no festejo solo”) y entregarse a los vicios sin sentir ningún tipo de culpa al respecto. 🎵🌪️'
),

Album(
  albumName:'Obsesionario',
  artist:'Tan Biónica',
  year: 2010,
  imgURL: 'https://i.scdn.co/image/ab67616d0000b273db56534f31217a77244b7e8f',
  description: 'Obsesionario es el segundo álbum de estudio del grupo musical argentino Tan Biónica, publicado el 1 de octubre de 2010. Con los éxitos como «Ella», «Beautiful», «Obsesionario en la mayor», «Loca» y «Pétalos», el grupo musical llegó nuevamente a las listas de las radios más importantes del país, y alcanzó una fuerte rotación en los canales de música nacionales e internacionales.'
),

Album(
  albumName:'Destinología',
  artist:'Tan Biónica',
  year: 2013,
  imgURL: 'https://upload.wikimedia.org/wikipedia/commons/b/bd/Destinolog%C3%ADa_logo.png',
  description: '"Destinología" es el tercer álbum de estudio de Tan Biónica, lanzado en 2013. Este disco representa un cambio en la dirección musical de la banda argentina, alejándose un poco del pop rock inicial para explorar sonidos más electrónicos y bailables.\n\nEl álbum está compuesto por canciones que fusionan elementos pop con influencias de la música electrónica y el dance, creando un estilo fresco y moderno. Entre los temas destacados se encuentran "Ella" y "La Melodía de Dios".\n\n"Destinología" también se caracteriza por letras que abordan temas románticos y reflexivos, con un enfoque en la conexión emocional y los sentimientos personales. Es considerado como un disco que marcó un momento importante en la evolución musical de Tan Biónica, consolidando su popularidad en América Latina.'
),

Album(
  albumName:'Hola Mundo',
  artist:'Tan Biónica',
  year: 2015,
  imgURL: 'https://miro.medium.com/v2/resize:fit:960/1*EWI-eDdKbOk6rYO2R5GCHQ.jpeg',
  description: 'Hola mundo es el cuarto y último álbum de estudio de la banda argentina Tan Biónica. Fue lanzado el 18 de mayo de 2015. La edición de este trabajo representó para el grupo una nueva etapa, dado que fue el primero en ser lanzado simultáneamente en Argentina y otros países hispanoamericanos, a través del sello Universal Music Group, con el cual habían firmado contrato en marzo de 2014. Además, según el bajista y director musical del grupo, Bambi, también fue "una aventura musical diferente" donde las canciones tuvieron "otro rumbo, otros riesgos". Contó con la participación de la Orquesta Filarmónica de Praga en algunas canciones.'
),

*/