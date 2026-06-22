import 'package:flutter/material.dart';

/// [ListViewScreen]
/// ListView adalah widget yang menampilkan daftar item secara scrollable
/// (bisa di-scroll). ListView biasa digunakan ketika jumlah item sudah
/// diketahui dan tidak terlalu banyak.
class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6584),
        foregroundColor: Colors.white,
        title: const Text('ListView Widget',
            style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: const Color(0xFFFF6584),
            child: const Text(
              '📋 3 Item Statis: A, B, C',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _ListItem(
                  label: 'Item A',
                  description: 'Ini adalah item pertama dalam ListView',
                  color: const Color(0xFFFF6584),
                  icon: Icons.looks_one_rounded,
                  index: 0,
                ),
                const SizedBox(height: 12),
                _ListItem(
                  label: 'Item B',
                  description: 'Ini adalah item kedua dalam ListView',
                  color: const Color(0xFFFF8FAA),
                  icon: Icons.looks_two_rounded,
                  index: 1,
                ),
                const SizedBox(height: 12),
                _ListItem(
                  label: 'Item C',
                  description: 'Ini adalah item ketiga dalam ListView',
                  color: const Color(0xFFFFB3C6),
                  icon: Icons.looks_3_rounded,
                  index: 2,
                ),
                const SizedBox(height: 20),
                _infoCard(
                  '📚 Penjelasan ListView',
                  'ListView adalah widget scroll dasar di Flutter.\n'
                  '• Menampilkan children secara vertikal (default)\n'
                  '• Scroll otomatis jika konten melebihi layar\n'
                  '• Baik digunakan untuk jumlah item yang sedikit & statis\n'
                  '• Properti: padding, scrollDirection, reverse, shrinkWrap',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String label;
  final String description;
  final Color color;
  final IconData icon;
  final int index;

  const _ListItem({
    required this.label,
    required this.description,
    required this.color,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: color.withOpacity(0.6), size: 16),
        ],
      ),
    );
  }
}

Widget _infoCard(String title, String content) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: const Color(0xFFFFE4EC),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFFFF6584).withOpacity(0.4)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF6584),
              fontSize: 13,
            )),
        const SizedBox(height: 6),
        Text(content,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF444444),
              height: 1.6,
            )),
      ],
    ),
  );
}
