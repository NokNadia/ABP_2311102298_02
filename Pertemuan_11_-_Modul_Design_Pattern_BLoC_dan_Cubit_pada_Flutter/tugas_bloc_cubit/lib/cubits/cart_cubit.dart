import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';

class CartCubit extends Cubit<Map<String, int>> {
  CartCubit() : super({});

  int get totalItems => state.values.fold(0, (sum, qty) => sum + qty);

  void addToCart(Product product) {
    final current = Map<String, int>.from(state);
    current[product.id] = (current[product.id] ?? 0) + 1;
    emit(current);
  }

  void removeFromCart(Product product) {
    final current = Map<String, int>.from(state);
    if (!current.containsKey(product.id)) return;
    if (current[product.id]! <= 1) {
      current.remove(product.id);
    } else {
      current[product.id] = current[product.id]! - 1;
    }
    emit(current);
  }

  int qtyInCart(String productId) => state[productId] ?? 0;
}
