import 'package:flutter/cupertino.dart';

import '../Model/expense_model.dart';

abstract class ExpenseState{
  List<ExpenseModel> expenseList;
  ExpenseState({required this.expenseList});
}

class ExpenseInitialState extends ExpenseState {
  ExpenseInitialState({required List<ExpenseModel> expenseList}) : super(expenseList: expenseList);
}

class ExpenseUpdatedState extends ExpenseState {
  ExpenseUpdatedState({required List<ExpenseModel> expenseList}) : super(expenseList: expenseList);

}