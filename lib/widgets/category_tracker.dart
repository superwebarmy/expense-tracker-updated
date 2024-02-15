import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTracker extends StatefulWidget {
  final String categoryName;
  final int categoryAmount;
  final Color color;
  const CategoryTracker({Key? key, required this.categoryName, required this.categoryAmount, required this.color}) : super(key: key);

  @override
  State<CategoryTracker> createState() => _CategoryTrackerState();
}

class _CategoryTrackerState extends State<CategoryTracker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.categoryName.toUpperCase(), style: GoogleFonts.oswald(color: widget.color)),
        Text(widget.categoryAmount.toString(), style: GoogleFonts.oswald()),
        const SizedBox(height: 5.0),
      ],
    );
  }
}
