class Contact {
  final String name;
  final String gender;
  final String photoUrl;
  final String email;
  final String address;
  final String phoneNumber;

  //  untuk inisialisasi field
  Contact({
    required this.name,
    required this.gender,
    required this.photoUrl,
    required this.email,
    required this.address,
    required this.phoneNumber,
  });

  // Factory method untuk membuat objek Contact dari JSON
  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    name: json['name'] ?? '-',               // Default '-' jika null
    gender: json['gender'] ?? '-',
    photoUrl: json['photoUrl'] ?? '',
    email: json['email'] ?? '-',
    address: json['address'] ?? '-',
    phoneNumber: json['phoneNumber'] ?? '-',
  );
}
