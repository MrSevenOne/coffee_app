class BeanModel {
  final String title;
  final String subtitle;
  final String country;
  final String imagePath;
  final int kg;
  final String description;
  final double price;

  BeanModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.country,
    required this.kg,
    required this.description,
    required this.price,
  });
}

final List<BeanModel> beanList = [
  BeanModel(
    title: "Ethiopian Arabica",
    subtitle: "Efiopiya Arabica",
    imagePath: "assets/coffeeImage/2.png",
    country: "Ethiopia",
    kg: 1,
    description:
        "Efiopiya Arabica dunyodagi eng mashhur qahvalardan biri bo‘lib, o‘zining nozik aromati va mevali ta’mi bilan ajralib turadi.",
    price: 18.5,
  ),
  BeanModel(
    title: "Colombian",
    subtitle: "Kolumbiya Supremo",
    imagePath: "assets/coffeeImage/2.png",
    country: "Colombia",
    kg: 1,
    description:
        "Kolumbiya Supremo — yumshoq, ammo boy ta’mli qahva turi. Unda karamell va shokolad notalari seziladi.",
    price: 16.0,
  ),
  BeanModel(
    title: "Brazil Santos",
    subtitle: "Braziliya Santos",
    imagePath: "assets/coffeeImage/2.png",
    country: "Brazil",
    kg: 1,
    description:
        "Brazil Santos — klassik, yumshoq va muvozanatli qahva turi bo‘lib, kundalik ichish uchun juda mos.",
    price: 14.0,
  ),
  BeanModel(
    title: "Kenya AA",
    subtitle: "Kenya AA",
    imagePath: "assets/coffeeImage/2.png",
    country: "Kenya",
    kg: 1,
    description:
        "Kenya AA — kuchli aromati va tiniq nordonligi bilan mashhur. Energiya va tetiklik baxsh etadi.",
    price: 19.0,
  ),
  BeanModel(
    title: "Yemen Mocha",
    subtitle: "Yemen Mocha",
    imagePath: "assets/coffeeImage/2.png",
    country: "Yemen",
    kg: 1,
    description:
        "Yemen Mocha — chuqur shokolad ta’mi va ozgina ziravor aromatlari bilan qadimiy qahva turlaridan biridir.",
    price: 20.0,
  ),
];
