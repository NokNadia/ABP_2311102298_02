import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';
import '../cubits/cart_cubit.dart';

final List<Product> _products = [
  const Product(id: '1', name: 'Kopi Hitam', category: 'Minuman', price: 15000, emoji: '☕'),
  const Product(id: '2', name: 'Nasi Goreng', category: 'Makanan', price: 25000, emoji: '🍳'),
  const Product(id: '3', name: 'Es Teh Manis', category: 'Minuman', price: 8000, emoji: '🧋'),
  const Product(id: '4', name: 'Mie Ayam', category: 'Makanan', price: 20000, emoji: '🍜'),
  const Product(id: '5', name: 'Pisang Goreng', category: 'Camilan', price: 10000, emoji: '🍌'),
  const Product(id: '6', name: 'Jus Alpukat', category: 'Minuman', price: 12000, emoji: '🥑'),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D2D3A),
        foregroundColor: Colors.white,
        title: const Text(
          '🛍️ Daftar Produk',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          BlocBuilder<CartCubit, Map<String, int>>(
            builder: (context, cart) {
              final total = cart.values.fold(0, (sum, q) => sum + q);
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_rounded),
                    onPressed: () => _showCart(context),
                  ),
                  if (total > 0)
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF4B2B),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '$total',
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
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            decoration: const BoxDecoration(
              color: Color(0xFF2D2D3A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pilih Produk',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                BlocBuilder<CartCubit, Map<String, int>>(
                  builder: (context, cart) {
                    final total = cart.values.fold(0, (sum, q) => sum + q);
                    return Text(
                      total > 0 ? '$total item di keranjang' : 'Belum ada item',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return _ProductCard(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showCart(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: context.read<CartCubit>(),
        child: _CartSheet(products: _products),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, Map<String, int>>(
      builder: (context, cart) {
        final qty = cart[product.id] ?? 0;
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2D2D3A).withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFF2D2D3A).withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(product.emoji, style: const TextStyle(fontSize: 28)),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      product.category,
                      style: TextStyle(fontSize: 11, color: Colors.grey[400]),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Rp ${_formatPrice(product.price)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Color(0xFF2D2D3A),
                      ),
                    ),
                  ],
                ),
              ),
              _QtyButton(
                qty: qty,
                onAdd: () => context.read<CartCubit>().addToCart(product),
                onRemove: qty > 0
                    ? () => context.read<CartCubit>().removeFromCart(product)
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatPrice(double price) {
    return price.toInt().toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
  }
}

class _QtyButton extends StatelessWidget {
  final int qty;
  final VoidCallback onAdd;
  final VoidCallback? onRemove;

  const _QtyButton({
    required this.qty,
    required this.onAdd,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (qty == 0) {
      return ElevatedButton(
        onPressed: onAdd,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2D2D3A),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          minimumSize: Size.zero,
        ),
        child: const Icon(Icons.add_rounded, size: 20),
      );
    }
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D3A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onRemove,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.remove_rounded, color: Colors.white, size: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$qty',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          InkWell(
            onTap: onAdd,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.add_rounded, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartSheet extends StatelessWidget {
  final List<Product> products;
  const _CartSheet({required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, Map<String, int>>(
      builder: (context, cart) {
        final items = cart.entries.toList();
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '🛒 Keranjang',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (items.isNotEmpty)
                      TextButton(
                        onPressed: () {
                          for (final p in products) {
                            context.read<CartCubit>().removeFromCart(p);
                          }
                        },
                        style: TextButton.styleFrom(foregroundColor: Colors.red),
                        child: const Text('Hapus Semua'),
                      ),
                  ],
                ),
              ),
              const Divider(),
              if (items.isEmpty)
                const Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.black26),
                        SizedBox(height: 12),
                        Text('Keranjang kosong', style: TextStyle(color: Colors.black38)),
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: items.length,
                    itemBuilder: (_, i) {
                      final entry = items[i];
                      final product = products.firstWhere((p) => p.id == entry.key);
                      final total = product.price * entry.value;
                      return ListTile(
                        leading: Text(product.emoji, style: const TextStyle(fontSize: 32)),
                        title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                        subtitle: Text('${entry.value} x Rp ${_formatPrice(product.price.toInt())}'),
                        trailing: Text(
                          'Rp ${_formatPrice(total.toInt())}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D2D3A),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              if (items.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Rp ${_formatPrice(_grandTotal(cart, products))}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF2D2D3A),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  int _grandTotal(Map<String, int> cart, List<Product> products) {
    int total = 0;
    for (final entry in cart.entries) {
      final product = products.firstWhere((p) => p.id == entry.key);
      total += (product.price * entry.value).toInt();
    }
    return total;
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
  }
}
