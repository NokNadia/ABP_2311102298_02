import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _ambilDariKamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() => _imageFile = File(photo.path));
      await NotificationService().showNotification(
        title: '📸 Foto Berhasil Diambil!',
        body: 'Foto berhasil diambil menggunakan Kamera.',
      );
    }
  }

  Future<void> _ambilDariGaleri() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() => _imageFile = File(photo.path));
      await NotificationService().showNotification(
        title: '🖼️ Foto Dipilih dari Galeri!',
        body: 'Foto berhasil dipilih dari Galeri.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        title: const Text(
          'Tugas Kamera & Notifikasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '📸 Ambil atau Pilih Foto',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Gunakan tombol di bawah untuk mengambil foto\nlangsung dari kamera atau memilih dari galeri.',
              style: TextStyle(fontSize: 13, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            if (_imageFile != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(
                  _imageFile!,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
            ] else
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFF6C63FF).withValues(alpha: 0.2),
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_outlined,
                      size: 72,
                      color: Color(0xFF6C63FF),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Belum ada foto',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Tekan tombol di bawah untuk memulai',
                      style: TextStyle(fontSize: 12, color: Colors.black38),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: _TombolAction(
                    icon: Icons.camera_alt_rounded,
                    label: 'Buka Kamera',
                    color: const Color(0xFF6C63FF),
                    onTap: _ambilDariKamera,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _TombolAction(
                    icon: Icons.photo_library_rounded,
                    label: 'Pilih dari Galeri',
                    color: const Color(0xFF43C6AC),
                    onTap: _ambilDariGaleri,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            if (_imageFile != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.check_circle, color: Color(0xFF43A047), size: 20),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '✅ Notifikasi akan muncul setelah foto diproses.',
                        style: TextStyle(fontSize: 12, color: Color(0xFF333333)),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _TombolAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _TombolAction({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.2),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 36),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
