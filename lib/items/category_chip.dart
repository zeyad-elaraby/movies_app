import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChip extends StatelessWidget {
  String text;
   CategoryChip({required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Color(0xFF514F4F))
      ),
      child: Padding(padding: EdgeInsets.symmetric(vertical: 6,horizontal: 17),
      child: Text(text,style: GoogleFonts.inter(fontSize: 10,fontWeight: FontWeight.w400,color:Color(0xFFCBCBCB)),)),
    );

  }
}
