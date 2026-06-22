import 'package:flutter/material.dart';

/// [ListViewBuilderScreen]
/// ListView.builder digunakan untuk membuat list secara dinamis dari sebuah
/// array/list data. Widget ini efisien karena hanya merender item yang
/// terlihat di layar (lazy loading), cocok untuk data yang banyak.
class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({super.key});

  // Data array yang akan ditampilkan
  static const List<Map<String, String>> mahasiswaList = [
    {'nama': 'Ahmad Rizal', 'nim': '2311102201', 'prodi': 'Informatika', 'avatar': '👨‍💻'},
    {'nama': 'Budi Santoso', 'nim': '2311102202', 'prodi': 'Sistem Informasi', 'avatar': '👨‍🎓'},
    {'nama': 'Citra Dewi', 'nim': '2311102203', 'prodi': 'Informatika', 'avatar': '👩‍💻'},
    {'nama': 'Dian Permata', 'nim': '2311102204', 'prodi': 'Teknik Komputer', 'avatar': '👩‍🎓'},
    {'nama': 'Eko Prasetyo', 'nim': '2311102205', 'prodi': 'Sistem Informasi', 'avatar': '🧑‍💻'},
    {'nama': 'Fani Kurnia', 'nim': '2311102206', 'prodi': 'Informatika', 'avatar': '👩‍🔬'},
    {'nama': 'Gilang Saputra', 'nim': '2311102207', 'prodi': 'Teknik Komputer', 'avatar': '🧑‍🎓'},
    {'nama': 'Hana Puspita', 'nim': '2311102208', 'prodi': 'Informatika', 'avatar': '👩‍💼'},
    {'nama': 'Irfan Maulana', 'nim': '2311102209', 'prodi': 'Sistem Informasi', 'avatar': '👨‍🔬'},
    {'nama': 'Joko Widodo', 'nim': '2311102210', 'prodi': 'Teknik Komputer', 'avatar': '🧑‍💼'},
  ];

  final List<Color> _cardColors = const [
    Color(0xFF6C63FF),
    Color(0xFF43C6AC),
    Color(0xFFFF6584),
    Color(0xFFF7971E),
    Color(0xFF56CCF2),
    Color(0xFFBB86FC),
    Color(0xFFFF4B2B),
    Color(0xFF00C9FF),
    Color(0xFFFFD93D),
    Color(0xFF6BCB77),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7971E),
        foregroundColor: Colors.white,
        title: const Text('ListView.builder Widget',
            style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: const Color(0xFFF7971E),
            child: Text(
              '📋 ${mahasiswaList.length} Data Mahasiswa dari Array',
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              itemCount: mahasiswaList.length,
              itemBuilder: (context, index) {
                final mahasiswa = mahasiswaList[index];
                final color = _cardColors[index % _cardColors.length];
                return _MahasiswaCard(
                  mahasiswa: mahasiswa,
                  color: color,
                  index: index,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: _infoCard(
              '📚 Penjelasan ListView.builder',
              'ListView.builder membuat list secara dinamis (lazy).\n'
              '• itemCount → jumlah total item dalam list\n'
              '• itemBuilder → fungsi yang membangun tiap item\n'
              '• (context, index) → context dan posisi item\n'
              '• Efisien: hanya render item yang terlihat di layar',
            ),
          ),
        ],
      ),
    );
  }
}

class _MahasiswaCard extends StatelessWidget {
  final Map<String, dynamic> mahasiswa;
  final Color color;
  final int index;

  const _MahasiswaCard({
    required this.mahasiswa,
    required this.color,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(mahasiswa['avatar'], style: const TextStyle(fontSize: 24)),
          ),
        ),
        title: Text(
          mahasiswa['nama'],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            fontSize: 15,
          ),
        ),
        subtitle: Text(
          '${mahasiswa['nim']} • ${mahasiswa['prodi']}',
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '#${index + 1}',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

Widget _infoCard(String title, String content) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: const Color(0xFFFFF3E0),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFFF7971E).withOpacity(0.4)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFF7971E),
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
