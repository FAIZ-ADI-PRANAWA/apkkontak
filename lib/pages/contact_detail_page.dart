import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactDetailPage extends StatelessWidget {
  final Contact contact;

  const ContactDetailPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Kontak')),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16),
          elevation: 8, // Efek bayangan untuk kartu
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Foto profil
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(contact.photoUrl),
                ),
                const SizedBox(height: 16),
                // Nama kontak
                Text(
                  contact.name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Gender
                Text(
                  contact.gender,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const Divider(height: 32),
                // Informasi tambahan (telepon, email, alamat)
                ContactInfoRow(
                  icon: Icons.phone,
                  label: 'Nomor',
                  value: contact.phoneNumber,
                ),
                const SizedBox(height: 12),
                ContactInfoRow(
                  icon: Icons.email,
                  label: 'Email',
                  value: contact.email,
                ),
                const SizedBox(height: 12),
                ContactInfoRow(
                  icon: Icons.home,
                  label: 'Alamat',
                  value: contact.address,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget kecil untuk menampilkan baris informasi kontak
class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ContactInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.deepPurple),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            '$label: $value',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
