import 'package:flutter/material.dart';

/// [ListViewSeparatedScreen]
/// ListView.separated adalah varian ListView yang secara otomatis
/// menambahkan widget pemisah (separator) di antara setiap item.
/// Berguna untuk tampilan list dengan garis/pembatas antar item.
class ListViewSeparatedScreen extends StatelessWidget {
  const ListViewSeparatedScreen({super.key});

  final List<Map<String, dynamic>> _menuMakanan = const [
    {
      'nama': 'Nasi Goreng Spesial',
      'harga': 'Rp 25.000',
      'kategori': 'Makanan Berat',
      'emoji': '🍳',
      'rating': '⭐⭐⭐⭐⭐',
    },
    {
      'nama': 'Mie Ayam Bakso',
      'harga': 'Rp 18.000',
      'kategori': 'Makanan Berat',
      'emoji': '🍜',
      'rating': '⭐⭐⭐⭐',
    },
    {
      'nama': 'Soto Betawi',
      'harga': 'Rp 22.000',
      'kategori': 'Makanan Berkuah',
      'emoji': '🍲',
      'rating': '⭐⭐⭐⭐⭐',
    },
    {
      'nama': 'Gado-Gado Jakarta',
      'harga': 'Rp 15.000',
      'kategori': 'Makanan Ringan',
      'emoji': '🥗',
      'rating': '⭐⭐⭐⭐',
    },
    {
      'nama': 'Rendang Daging',
      'harga': 'Rp 35.000',
      'kategori': 'Makanan Berat',
      'emoji': '🥩',
      'rating': '⭐⭐⭐⭐⭐',
    },
    {
      'nama': 'Es Teh Manis',
      'harga': 'Rp 5.000',
      'kategori': 'Minuman',
      'emoji': '🧋',
      'rating': '⭐⭐⭐',
    },
    {
      'nama': 'Jus Alpukat',
      'harga': 'Rp 12.000',
      'kategori': 'Minuman',
      'emoji': '🥤',
      'rating': '⭐⭐⭐⭐',
    },
    {
      'nama': 'Pisang Goreng Keju',
      'harga': 'Rp 10.000',
      'kategori': 'Camilan',
      'emoji': '🍌',
      'rating': '⭐⭐⭐⭐',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF56CCF2),
        foregroundColor: Colors.white,
        title: const Text('ListView.separated Widget',
            style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: const Color(0xFF56CCF2),
            child: const Text(
              '🍽️ Menu Kantin • Ada garis pembatas antar item',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              itemCount: _menuMakanan.length,
              // separatorBuilder: widget yang muncul di antara tiap item
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const SizedBox(width: 60),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF56CCF2).withOpacity(0.0),
                              const Color(0xFF56CCF2).withOpacity(0.5),
                              const Color(0xFF56CCF2).withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 60),
                  ],
                ),
              ),
              itemBuilder: (context, index) {
                final menu = _menuMakanan[index];
                return _MenuCard(menu: menu, index: index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: _infoCard(
              '📚 Penjelasan ListView.separated',
              'ListView.separated menambahkan separator antar item.\n'
              '• separatorBuilder → widget pembatas antar item\n'
              '• itemBuilder → builder untuk setiap item\n'
              '• itemCount → jumlah total item\n'
              '• Separator otomatis muncul di antara item, bukan di akhir',
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final Map<String, dynamic> menu;
  final int index;

  const _MenuCard({required this.menu, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFF56CCF2).withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(menu['emoji'], style: const TextStyle(fontSize: 26)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu['nama'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  menu['kategori'],
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  menu['rating'],
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF56CCF2).withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              menu['harga'],
              style: const TextStyle(
                color: Color(0xFF0099CC),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
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
      color: const Color(0xFFE3F8FF),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFF56CCF2).withOpacity(0.4)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF0099CC),
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
