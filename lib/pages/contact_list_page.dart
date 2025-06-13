import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/contact.dart';
import 'contact_detail_page.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  late Future<List<Contact>> contacts;

  // Mengambil data kontak dari API (webservice)
  Future<List<Contact>> fetchContacts() async {
    final res = await http.get(
      Uri.parse('https://dummyjson.com/c/6c43-808e-44ea-b270'),
    );

    if (res.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(res.body);
      final List<dynamic> users = json['users'] ?? [];

      // Mengubah setiap item JSON menjadi objek Contact
      return users.map((e) => Contact.fromJson(e)).toList();
    } else {
      throw Exception('Gagal fetch data kontak: ${res.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    contacts = fetchContacts(); // Memulai fetch data saat halaman dimuat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kontak')),
      body: FutureBuilder<List<Contact>>(
        future: contacts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Menampilkan loading saat data sedang diambil
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Menampilkan error jika fetch gagal
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Menampilkan pesan jika tidak ada data
            return const Center(child: Text('Tidak ada kontak'));
          }

          final contactList = snapshot.data!;
          return ListView.builder(
            itemCount: contactList.length,
            itemBuilder: (context, index) {
              final contact = contactList[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(contact.photoUrl), // Foto profil
                  ),
                  title: Text(contact.name),
                  subtitle: Text(contact.gender),
                  onTap: () {
                    // Navigasi ke halaman detail saat diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ContactDetailPage(contact: contact),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
