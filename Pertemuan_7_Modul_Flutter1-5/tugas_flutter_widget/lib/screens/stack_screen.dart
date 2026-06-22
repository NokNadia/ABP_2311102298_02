import 'package:flutter/material.dart';

/// [StackScreen]
/// Stack adalah widget yang menumpuk widget-widget di atasnya (seperti layer).
/// Widget pertama di dalam Stack berada di bagian bawah (background),
/// dan widget selanjutnya ditumpuk di atasnya. Dikombinasikan dengan
/// Positioned untuk mengatur letak widget secara tepat.
class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFBB86FC),
        foregroundColor: Colors.white,
        title: const Text('Stack Widget',
            style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionLabel('🔲 Stack Dasar (Kotak Bertumpuk)'),
            const SizedBox(height: 12),

            // Demo Stack 1: Kotak bertumpuk
            Center(
              child: SizedBox(
                width: 250,
                height: 200,
                child: Stack(
                  children: [
                    // Layer 1 (paling bawah) - kotak besar
                    Container(
                      width: 200,
                      height: 160,
                      decoration: BoxDecoration(
                        color: const Color(0xFFBB86FC).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFBB86FC),
                          width: 2,
                        ),
                      ),
                    ),
                    // Layer 2 - kotak tengah
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        width: 160,
                        height: 120,
                        decoration: BoxDecoration(
                          color: const Color(0xFF9C6FFF).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    // Layer 3 - kotak paling atas
                    Positioned(
                      top: 40,
                      left: 40,
                      child: Container(
                        width: 120,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6C63FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Paling Atas',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            _sectionLabel('🃏 Stack: Kartu Profil'),
            const SizedBox(height: 12),

            // Demo Stack 2: Profile Card
            Center(
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Stack(
                  children: [
                    // Background gradient
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6C63FF), Color(0xFFBB86FC)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    // Decorative circles
                    Positioned(
                      top: -20,
                      right: -20,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 40,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    // Content di atas background
                    Positioned(
                      top: 16,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nok Nadia',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'NIM: 2311102298',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              '🎓 Mahasiswa Informatika',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Avatar photo bertumpuk di pojok bawah kanan
                    Positioned(
                      bottom: 0,
                      right: 20,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6C63FF).withOpacity(0.4),
                              blurRadius: 12,
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text('👩‍💻', style: TextStyle(fontSize: 40)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            _sectionLabel('🏷️ Stack: Badge/Label'),
            const SizedBox(height: 12),

            // Demo Stack 3: Badge notification
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BadgeIcon(
                  icon: Icons.notifications_rounded,
                  color: const Color(0xFFBB86FC),
                  badgeCount: '3',
                ),
                _BadgeIcon(
                  icon: Icons.shopping_cart_rounded,
                  color: const Color(0xFFFF6584),
                  badgeCount: '12',
                ),
                _BadgeIcon(
                  icon: Icons.mail_rounded,
                  color: const Color(0xFF43C6AC),
                  badgeCount: '99+',
                ),
              ],
            ),
            const SizedBox(height: 24),

            _infoCard(
              '📚 Penjelasan Stack',
              'Stack menumpuk widget satu di atas yang lain (seperti layer).\n'
              '• Widget pertama = lapisan paling bawah\n'
              '• Widget terakhir = lapisan paling atas\n'
              '• Positioned → mengatur posisi (top, left, bottom, right)\n'
              '• Alignment → mengatur alignment default anak widget\n'
              '• Cocok untuk: badge, overlay, kartu profil, hero section',
            ),
          ],
        ),
      ),
    );
  }
}

class _BadgeIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String badgeCount;

  const _BadgeIcon({
    required this.icon,
    required this.color,
    required this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color, size: 36),
        ),
        Positioned(
          top: -6,
          right: -6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFFF4B2B),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Text(
              badgeCount,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
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
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: const Color(0xFFF3E8FF),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFFBB86FC).withOpacity(0.4)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF7B2FBE),
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
