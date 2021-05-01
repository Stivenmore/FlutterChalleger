class Albums {
  final String image;
  final String name;
  final String imageartisc;

  Albums({this.image, this.name, this.imageartisc});
}

List<Albums> albums = [
  Albums(
      image: 'assets/albums/img1.png',
      name: 'Disaster',
      imageartisc: 'assets/persons/person1.png'),
  Albums(
      image: 'assets/albums/img2.png',
      name: 'Order',
      imageartisc: 'assets/persons/person2.png'),
  Albums(
      image: 'assets/albums/img3.png',
      name: 'Are you sure?',
      imageartisc: 'assets/persons/person3.png')
];

class Artists {
  final String path;

  Artists({this.path});
}

List<Artists> artists = [
  Artists(path: 'assets/persons/person1.png'),
  Artists(path: 'assets/persons/person2.png'),
  Artists(path: 'assets/persons/person3.png'),
  Artists(path: 'assets/persons/person4.png')
];
