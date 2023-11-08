
class Investor {
  final String name;
  final String imageUrl;
  final String email; // Adding email field

  Investor({
    required this.name,
    required this.imageUrl,
    required this.email,
  });
}

List<Investor> investors = [
  Investor(
    name: 'Umair',
    imageUrl: 'assets/images/5.jpg',
    email: 'umair@admin.com',
  ),
  Investor(
    name: 'Afaq',
    imageUrl: 'assets/images/6.jpg',
    email: 'afaq@admin.com',
  ),
  Investor(
    name: 'Mahwish Ponam',
    imageUrl: 'assets/images/7.jpg',
    email: 'ponammahwish@admin.com',
  ),
  Investor(
    name: 'Waheed',
    imageUrl: 'assets/images/8.jpg',
    email: 'waheed@admin.com',
  ),
  Investor(
    name: 'Umair',
    imageUrl: 'assets/images/1.jpg',
    email: 'umair@admin.com',
  ),
  Investor(
    name: 'Afaq',
    imageUrl: 'assets/images/2.jpg',
    email: 'afaq@admin.com',
  ),
  // Add more investor objects as needed
];