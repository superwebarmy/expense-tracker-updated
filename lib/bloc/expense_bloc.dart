import 'package:flutter_bloc/flutter_bloc.dart';
import 'expense_event.dart';
import 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(ExpenseInitialState(expenseList: [])) {
    on<AddExpenseEvent>(_addExpense);
  }

  void _addExpense(AddExpenseEvent event, Emitter<ExpenseState> emit){
    state.expenseList.add(event.expenseModel);
    emit(ExpenseUpdatedState(expenseList: state.expenseList));
  }
}