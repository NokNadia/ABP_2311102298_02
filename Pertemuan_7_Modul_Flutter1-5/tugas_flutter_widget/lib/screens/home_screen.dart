import 'package:flutter/material.dart';
import 'container_screen.dart';
import 'gridview_screen.dart';
import 'listview_screen.dart';
import 'listview_builder_screen.dart';
import 'listview_separated_screen.dart';
import 'stack_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menus = [
      {
        'title': 'Container',
        'subtitle': 'Kotak berwarna dengan dekorasi',
        'icon': Icons.crop_square_rounded,
        'color': const Color(0xFF6C63FF),
        'screen': const ContainerScreen(),
      },
      {
        'title': 'GridView',
        'subtitle': 'Tampilan grid 6+ item',
        'icon': Icons.grid_view_rounded,
        'color': const Color(0xFF43C6AC),
        'screen': const GridViewScreen(),
      },
      {
        'title': 'ListView',
        'subtitle': 'List sederhana A, B, C',
        'icon': Icons.list_rounded,
        'color': const Color(0xFFFF6584),
        'screen': const ListViewScreen(),
      },
      {
        'title': 'ListView.builder',
        'subtitle': 'List dari data array dinamis',
        'icon': Icons.view_list_rounded,
        'color': const Color(0xFFF7971E),
        'screen': const ListViewBuilderScreen(),
      },
      {
        'title': 'ListView.separated',
        'subtitle': 'List dengan garis pembatas',
        'icon': Icons.format_list_bulleted_rounded,
        'color': const Color(0xFF56CCF2),
        'screen': const ListViewSeparatedScreen(),
      },
      {
        'title': 'Stack',
        'subtitle': 'Tampilan widget bertumpuk',
        'icon': Icons.layers_rounded,
        'color': const Color(0xFFBB86FC),
        'screen': const StackScreen(),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tugas Praktikum Flutter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'NIM: 2311102298 • Nok Nadia',
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header gradient banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF9D8FFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Text(
              '🧩 Pilih Widget untuk Demo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: menus.length,
              itemBuilder: (context, index) {
                final menu = menus[index];
                return _MenuCard(
                  title: menu['title'],
                  subtitle: menu['subtitle'],
                  icon: menu['icon'],
                  color: menu['color'],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => menu['screen']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _MenuCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: color,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded, color: color, size: 18),
        ),
      ),
    );
  }
}
