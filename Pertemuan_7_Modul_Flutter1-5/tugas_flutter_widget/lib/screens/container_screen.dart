import 'package:flutter/material.dart';

/// [ContainerScreen]
/// Container adalah widget dasar di Flutter yang berfungsi sebagai kotak
/// (box model). Container dapat diberi warna, padding, margin, border, shadow,
/// dan dekorasi lainnya. Mirip seperti <div> dalam HTML/CSS.
class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        title: const Text('Container Widget',
            style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionLabel('📦 Contoh Container Dasar'),
            const SizedBox(height: 12),

            // Container 1: Warna solid dengan rounded corners
            Center(
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFF6C63FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'Container Ungu',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            _sectionLabel('🎨 Container dengan Gradient'),
            const SizedBox(height: 12),

            // Container 2: Gradient
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF43C6AC), Color(0xFF191654)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  'Container Gradient',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            _sectionLabel('🌟 Container dengan Shadow & Border'),
            const SizedBox(height: 12),

            // Container 3: Shadow + border
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF6C63FF), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6C63FF).withOpacity(0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Icon(Icons.star_rounded, color: Color(0xFF6C63FF), size: 40),
                  SizedBox(height: 8),
                  Text(
                    'Container dengan Shadow & Border',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6C63FF),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            _sectionLabel('🔵 Container Berbagai Warna'),
            const SizedBox(height: 12),

            // Row of colored containers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _colorBox(const Color(0xFFFF6584), 'Merah'),
                _colorBox(const Color(0xFFF7971E), 'Orange'),
                _colorBox(const Color(0xFF43C6AC), 'Hijau'),
                _colorBox(const Color(0xFF56CCF2), 'Biru'),
              ],
            ),
            const SizedBox(height: 24),

            // Penjelasan widget
            _infoCard(
              '📚 Penjelasan Container',
              'Container adalah widget serba guna di Flutter. Properti utamanya:\n'
              '• width / height → ukuran kotak\n'
              '• color → warna latar\n'
              '• padding → jarak dalam\n'
              '• margin → jarak luar\n'
              '• decoration → BoxDecoration (border, shadow, gradient, radius)',
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorBox(Color color, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.black54)),
      ],
    );
  }
}

Widget _sectionLabel(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Color(0xFF333333),
    ),
  );
}

Widget _infoCard(String title, String content) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFEDE9FF),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFF6C63FF).withOpacity(0.3)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF6C63FF),
              fontSize: 14,
            )),
        const SizedBox(height: 8),
        Text(content,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF444444),
              height: 1.6,
            )),
      ],
    ),
  );
}
