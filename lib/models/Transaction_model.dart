import 'package:meta/meta.dart';

class Transaction {
  final int id;
  final int user_id;
  final int order_id;
  final int restaurant_id;
  final int menu_item_id;
  final double dr;
  final double cr;
  final double balance;
  final String description;
  final String date_time;
  // Restaurant restaurant;

  Transaction({
    required this.id,
    required this.user_id,
    required this.order_id,
    required this.restaurant_id,
    required this.menu_item_id,
    required this.dr,
    required this.cr,
    required this.balance,
    required this.description,
    required this.date_time,
    // required this.restaurant
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      user_id: json['user_id'],
      order_id: json['order_id'],
      restaurant_id: json['restaurant_id'],
      menu_item_id: json['menu_item_id'],
      dr: json['dr'],
      cr: json['cr'],
      balance: json['balance'],
      description: json['description'],
      date_time: json['date_time'],
      // restaurant: Restaurant.fromJson(json['restaurant'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': user_id,
      'order_id': order_id,
      'restaurant_id': restaurant_id,
      'menu_item_id': menu_item_id,
      'dr': dr,
      'cr': cr,
      'balance': balance,
      'description': description,
      'date_time': date_time,
      // 'restaurant': restaurant.toJson()
    };
  }

  @override
  List<Object> get props => [
        id,
        user_id,
        order_id,
        restaurant_id,
        menu_item_id,
        dr,
        cr,
        balance,
        description,
        date_time,
        // restaurant
      ];
}
