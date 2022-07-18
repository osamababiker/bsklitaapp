class Chat {
  final String name, location, image, time;
  final double rating;
  final bool isActive;

  Chat({
    required this.name,
    required this.rating,
    required this.location,
    required this.image,
    required this.time,
    required this.isActive,
  });
}

List chatsData = [
  Chat(
    name: "أسامة محمد",
    rating: 4.8,
    location: "امدرمان الثورة",
    image: "assets/images/user-icon.jpg",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "علي احمد",
    rating: 3.5,
    location: "الخرطوم 2",
    image: "assets/images/user-icon.jpg",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "محمد احمد",
    rating: 4.0,
    location: "الكلاكلة",
    image: "assets/images/user-icon.jpg",
    time: "5d ago",
    isActive: false,
  ),
  
];
