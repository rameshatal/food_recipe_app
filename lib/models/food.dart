class Food {
  String name;
  String image;
  double cal;
  double time;
  double rate;
  int reviews;
  bool isLiked;

  Food({
    required this.name,
    required this.image,
    required this.cal,
    required this.time,
    required this.rate,
    required this.reviews,
    required this.isLiked,
  });
}

final List<Food> foods = [
  Food(
    name: 'Spicy Ramen Noodles',
    image: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQ0LnzJ4y-LPrel4uiGTFN3RtbemIxd0Blsl7MkoFSuKJosg1DS',
    cal: 120,
    time: 15,
    rate: 4.4,
    reviews: 23,
    isLiked: false,
  ),
  Food(
    name: 'Beef Steak',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6DST-ivdyYkFiCLnvIJNAJARmDgoAB9MqMW2_g3vHMA&s',
    cal: 140,
    time: 25,
    rate: 4.4,
    reviews: 23,
    isLiked: true,
  ),
  Food(
    name: 'Butter Chicken',
    image: 'https://myfoodstory.com/wp-content/uploads/2020/04/restaurant-style-butter-chicken-masala-murgh-makhani-1.jpg',
    cal: 130,
    time: 18,
    rate: 4.2,
    reviews: 10,
    isLiked: false,
  ),
  Food(
    name: 'French Toast',
    image: 'https://media.istockphoto.com/id/171269841/photo/french-toast-with-fruit-and-syrup-on-a-marble-countertop.jpg?s=612x612&w=0&k=20&c=cuv4u6aroVqt8IGD-0kb5BPrXsdob6V9x91IKpRBBWg=',
    cal: 110,
    time: 16,
    rate: 4.6,
    reviews: 90,
    isLiked: true,
  ),
  Food(
    name: 'Dumplings',
    image: 'https://img.freepik.com/free-photo/view-delicious-dumplings_23-2150777769.jpg?size=626&ext=jpg&ga=GA1.1.1442689247.1699417731&semt=sph',
    cal: 150,
    time: 30,
    rate: 4.0,
    reviews: 76,
    isLiked: false,
  ),
  Food(
    name: 'Mexican Pizza',
    image: 'https://t3.ftcdn.net/jpg/05/70/42/58/240_F_570425839_kYwBrg6m0NYAs5V4hefQBDRZNHXILGu1.jpg',
    cal: 140,
    time: 25,
    rate: 4.4,
    reviews: 23,
    isLiked: false,
  ),
];
