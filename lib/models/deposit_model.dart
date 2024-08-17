import 'package:equatable/equatable.dart';
import 'package:mall_plus_new_customer_app/models/Transaction_model.dart';
import 'package:meta/meta.dart';

class Deposit extends Equatable {
  final int id;
  final int user_id;
  final double opening_balance;
  final double dr;
  final double cr;
  final double balance;
  final List<Transaction> transactions;
  final bool status;

  Deposit({
    required this.id,
    required this.user_id,
    required this.opening_balance,
    required this.dr,
    required this.cr,
    required this.balance,
    required this.transactions,
    required this.status,
  });

  factory Deposit.fromJson(Map<String, dynamic> json) {
    var transactionList = json['transactions'] as List<dynamic>;
    List<Transaction> transactions =
        transactionList.map((e) => Transaction.fromJson(e)).toList();

    return Deposit(
      id: json['id'],
      user_id: json['user_id'],
      opening_balance: json['opening_balance'],
      dr: json['dr'],
      cr: json['cr'],
      balance: json['balance'],
      transactions: transactions,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> transactionsJson =
        transactions.map((transaction) => transaction.toJson()).toList();

    return {
      'id': id,
      'user_id': user_id,
      'opening_balance': opening_balance,
      'dr': dr,
      'cr': cr,
      'balance': balance,
      'transactions': transactionsJson,
      'status': status,
    };
  }

  Deposit copyWith({
    int? id,
    int? user_id,
    double? opening_balance,
    double? dr,
    double? cr,
    double? balance,
    List<Transaction>? transactions,
    bool? status,
  }) {
    return Deposit(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      opening_balance: opening_balance ?? this.opening_balance,
      dr: dr ?? this.dr,
      cr: cr ?? this.cr,
      balance: balance ?? this.balance,
      transactions: transactions ?? this.transactions,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        id,
        user_id,
        opening_balance,
        dr,
        cr,
        balance,
        transactions,
        status,
      ];
}
