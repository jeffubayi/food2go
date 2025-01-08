// lib/services/order_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/cart_item.dart';

class OrderService {
  final _supabase = Supabase.instance.client;

  Future<String> createOrder({
    required List<CartItem> items,
    required double totalAmount,
    required double deliveryFee,
    double? couponDiscount,
    String? deliveryAddress,
  }) async {
    try {
      // First create the order
      final orderResponse = await _supabase
          .from('orders')
          .insert({
            'user_id': _supabase.auth.currentUser!.id,
            'total_amount': totalAmount,
            'delivery_fee': deliveryFee,
            'coupon_discount': couponDiscount,
            'delivery_address': deliveryAddress,
            'status': 'pending'
          })
          .select('id')
          .single();

      final orderId = orderResponse['id'];

      // Then create order items
      await _supabase.from('order_items').insert(
            items
                .map((item) => {
                      'order_id': orderId,
                      'product_id': item.id,
                      'quantity': item.quantity,
                      'price': item.price,
                    })
                .toList(),
          );

      return orderId;
    } catch (e) {
      throw 'Failed to create order: $e';
    }
  }

  Future<List<Map<String, dynamic>>> getUserOrders() async {
    try {
      final response = await _supabase
          .from('orders')
          .select('''
            *,
            order_items (
              *,
              product:products (*)
            )
          ''')
          .eq('user_id', _supabase.auth.currentUser!.id)
          .order('created_at', ascending: false);

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw 'Failed to fetch orders: $e';
    }
  }
}
