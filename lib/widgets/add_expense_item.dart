import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppExpenseItem extends StatefulWidget {
  final String expenseCategoryName;
  final String expenseName;
  final String expenseAmount;
  final DateTime expenseDate;
  const AppExpenseItem({Key? key, required this.expenseCategoryName, required this.expenseName, required this.expenseAmount, required this.expenseDate}) : super(key: key);

  @override
  State<AppExpenseItem> createState() => _AppExpenseItemState();
}

class _AppExpenseItemState extends State<AppExpenseItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: const Color(0xff5A47D0),
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Text(widget.expenseCategoryName.toUpperCase(), style: GoogleFonts.oswald(color: Colors.white)),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.expenseName.toUpperCase(), style: GoogleFonts.oswald(color: Colors.black, fontSize: 18.0)),
                Text(DateFormat('dd MMM, yyyy').format(widget.expenseDate).toUpperCase(), style: GoogleFonts.oswald(color: Colors.grey))
              ],
            ),
          ),
          Text('${widget.expenseAmount} INR', style: GoogleFonts.oswald(fontSize: 18.0))
        ],
      ),
    );
  }
}
