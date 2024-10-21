class CollectorsSets {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final String price;

  CollectorsSets({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

List<CollectorsSets> initialCars = [
  CollectorsSets(
    id: 0,
    name: "Brightfist",
    description: "Содержит все предметы из набора Brightfist для Marci:— Brightfist Armor — Brightfist Back; — Brightfist Shoulder; — Brightfist Head.",
    imageUrl:
    "https://collectorsshop.ru/_next/image?url=https%3A%2F%2Fcollectorsshop.ru%2Fimg%2Fcatalog%2Fitems%2Fmain_images%2F2023%2F08%2F1395.png&w=1920&q=75",
    price: '1199 руб',
  ),
];
