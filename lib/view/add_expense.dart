import 'package:expensetracker/Model/expense_model.dart';
import 'package:expensetracker/bloc/expense_bloc.dart';
import 'package:expensetracker/bloc/expense_event.dart';
import 'package:expensetracker/bloc/expense_state.dart';
import 'package:expensetracker/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {


  TextEditingController expenseNameController = TextEditingController();
  TextEditingController expenseAmountController = TextEditingController();
  ExpenseBloc expenseBloc = ExpenseBloc();
  String? expenseCategory;
  List<String> categoryList = ['household', 'food', 'subscription', 'entertainment', 'other'];

  void selectExpenseCategory(int index){
    setState(() {
      expenseCategory = categoryList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(controller: expenseNameController, textInputAction: TextInputAction.next, textInputType: TextInputType.text, hintText: 'EXPENSE NAME'),
          const SizedBox(height: 15.0),
          AppTextField(controller: expenseAmountController, textInputAction: TextInputAction.done, textInputType: TextInputType.number, hintText: 'EXPENSE AMOUNT'),
          const SizedBox(height: 15.0),
          Text('SELECT CATEGORY', style: GoogleFonts.oswald(color: Colors.grey, fontSize: 18.0)),
          const SizedBox(height: 15.0),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0, mainAxisExtent: 60.0),
              itemCount: categoryList.length,
              itemBuilder: (context, int index){
                return InkWell(
                  onTap: (){
                    selectExpenseCategory(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: expenseCategory != null && expenseCategory== categoryList[index] ? const Color(0xff5A47D0) : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Center(child: Text(categoryList[index].toUpperCase(), style: GoogleFonts.oswald(color: expenseCategory != null && expenseCategory == categoryList[index] ? Colors.white : Colors.black))),
                  ),
                );
              },
            ),
          ),
          BlocBuilder<ExpenseBloc, ExpenseState>(
            bloc: expenseBloc,
            builder: (context, state){
              return SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: (){
                    if(expenseNameController.text.isNotEmpty && expenseAmountController.text.isNotEmpty && expenseCategory != null){
                      ExpenseModel expenseModel = ExpenseModel(expenseName: expenseNameController.text.trim(), expenseAmount: int.parse(expenseAmountController.text), expenseCategory: expenseCategory!, expenseDate: DateTime.now());
                      expenseBloc.add(AddExpenseEvent(expenseModel: expenseModel));
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('PLEASE FILL IN ALL THE FIELDS', style: GoogleFonts.oswald(color: Colors.white)), backgroundColor: const Color(0xff5A47D0)));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5A47D0)
                  ),
                  child: Text('ADD EXPENSE', style: GoogleFonts.oswald(color: Colors.white)),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
