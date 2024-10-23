class User {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String token;
  final double balance;
  final String pin;
  final String image;
  final String address;
  final String createdAt;
  final String updatedAt;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.token,
    required this.balance,
    required this.pin,
    required this.image,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final userData = json['data'];
    return User(
      id: userData['id'] ?? '',
      name: userData['name'],
      email: userData['email'],
      phone: userData['phone'] ?? '',
      password: userData['password'] ?? '',
      token: userData['token'] ?? '',
      balance: double.tryParse(userData['balance'].toString()) ?? 0.0,
      pin: userData['pin'] ?? '',
      image: userData['image'] ?? '',
      address: userData['address'] ?? '',
      createdAt: userData['created_at'] ?? '',
      updatedAt: userData['updated_at'] ?? '',
    );
  }
}
