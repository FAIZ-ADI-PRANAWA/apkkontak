import 'package:flutter/material.dart';
import 'pages/contact_list_page.dart';

void main() {
  runApp(const MyApp()); // Menjalankan aplikasi Flutter
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kontak',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Tema utama aplikasi
        useMaterial3: true,
      ),
      home: const ContactListPage(), // Halaman utama aplikasi
    );
  }
}
