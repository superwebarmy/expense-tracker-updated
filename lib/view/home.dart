import 'package:expensetracker/View/add_expense.dart';
import 'package:expensetracker/bloc/expense_bloc.dart';
import 'package:expensetracker/bloc/expense_state.dart';
import 'package:expensetracker/widgets/add_expense_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void showExpenseBottomSheet(){
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context){
        return const Scaffold(body: AddExpense());
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
              decoration: const BoxDecoration(
                  color: Color(0xffF5F5FC)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateFormat('dd MMM, yyyy').format(DateTime.now()).toUpperCase(), style: GoogleFonts.oswald()),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('EXPENSE TRACKER', style: GoogleFonts.bebasNeue(fontSize: 25.0, color: Colors.black)),
                          Text('HELLO, WELCOME BACK', style: GoogleFonts.oswald())
                        ],
                      ),
                      const CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage('assets/images/man.png'),
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ExpenseBloc, ExpenseState>(
                builder: (context, state){
                  if(state is ExpenseInitialState){
                    return Container(
                      padding: const EdgeInsets.all(15.0),
                      color: const Color(0xffE3E3FD),
                      child: ListView.builder(
                        itemCount: state.expenseList.length,
                        itemBuilder: (context, int index){
                          return AppExpenseItem(expenseCategoryName: state.expenseList[index].expenseCategory, expenseName: state.expenseList[index].expenseName, expenseAmount: state.expenseList[index].expenseAmount.toString(), expenseDate: state.expenseList[index].expenseDate);
                        },
                      ),
                    );
                  } else if(state is ExpenseUpdatedState){
                    return Container(
                      padding: const EdgeInsets.all(15.0),
                      color: const Color(0xffE3E3FD),
                      child: ListView.builder(
                        itemCount: state.expenseList.length,
                        itemBuilder: (context, int index){
                          return AppExpenseItem(expenseCategoryName: state.expenseList[index].expenseCategory, expenseName: state.expenseList[index].expenseName, expenseAmount: state.expenseList[index].expenseAmount.toString(), expenseDate: state.expenseList[index].expenseDate);
                        },
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator(color: Colors.brown));
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showExpenseBottomSheet();
        },
        backgroundColor: const Color(0xff5A47D0),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
