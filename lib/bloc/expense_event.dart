import 'package:expensetracker/Model/expense_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ExpenseEvent{}

class AddExpenseEvent extends ExpenseEvent{
  final ExpenseModel expenseModel;

  AddExpenseEvent({required this.expenseModel});
}


