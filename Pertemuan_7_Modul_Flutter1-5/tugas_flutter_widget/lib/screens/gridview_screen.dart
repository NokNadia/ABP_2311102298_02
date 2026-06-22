import 'package:flutter/material.dart';

/// [GridViewScreen]
/// GridView adalah widget yang menampilkan item dalam bentuk grid (baris & kolom).
/// Cocok untuk menampilkan galeri foto, produk, atau konten berbentuk kartu.
/// crossAxisCount menentukan jumlah kolom dalam grid.
class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  final List<Map<String, dynamic>> _gridItems = const [
    {'label': 'Apel 🍎', 'color': Color(0xFFFF6584), 'icon': Icons.local_florist_rounded},
    {'label': 'Mangga 🥭', 'color': Color(0xFFF7971E), 'icon': Icons.emoji_nature_rounded},
    {'label': 'Anggur 🍇', 'color': Color(0xFF6C63FF), 'icon': Icons.bubble_chart_rounded},
    {'label': 'Semangka 🍉', 'color': Color(0xFF43C6AC), 'icon': Icons.eco_rounded},
    {'label': 'Pisang 🍌', 'color': Color(0xFFFFD93D), 'icon': Icons.wb_sunny_rounded},
    {'label': 'Strawberry 🍓', 'color': Color(0xFFFF4B2B), 'icon': Icons.favorite_rounded},
    {'label': 'Jeruk 🍊', 'color': Color(0xFFFF8C00), 'icon': Icons.circle_rounded},
    {'label': 'Melon 🍈', 'color': Color(0xFF56CCF2), 'icon': Icons.water_drop_rounded},
    {'label': 'Ceri 🍒', 'color': Color(0xFFBB86FC), 'icon': Icons.star_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF43C6AC),
        foregroundColor: Colors.white,
        title: const Text('GridView Widget',
            style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: const Color(0xFF43C6AC),
            child: const Text(
              '📱 Grid 3 Kolom • ${9} Item Buah',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: _gridItems.map((item) => _GridCard(item: item)).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: _infoCard(
              '📚 Penjelasan GridView',
              'GridView menampilkan widget dalam bentuk grid.\n'
              '• crossAxisCount → jumlah kolom\n'
              '• mainAxisSpacing → jarak antar baris\n'
              '• crossAxisSpacing → jarak antar kolom\n'
              '• GridView.count → grid dengan jumlah kolom tetap\n'
              '• GridView.builder → grid dinamis dari data',
            ),
          ),
        ],
      ),
    );
  }
}

class _GridCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const _GridCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (item['color'] as Color).withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: (item['color'] as Color).withOpacity(0.4),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: item['color'],
              shape: BoxShape.circle,
            ),
            child: Icon(item['icon'], color: Colors.white, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            item['label'],
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: item['color'],
            ),
            textAlign: TextAlign.center,
          ),
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
      color: const Color(0xFFE0F7F4),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFF43C6AC).withOpacity(0.4)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF43C6AC),
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
