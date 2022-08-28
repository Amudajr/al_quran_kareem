import 'package:al_quran_kareem/model/qari.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Qaris extends StatefulWidget {
  const Qaris({Key? key, required this.qari, required this.ontap})
      : super(key: key);
  final Qari qari;
  final VoidCallback ontap;

  @override
  State<Qaris> createState() => _QarisState();
}

class _QarisState extends State<Qaris> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: widget.ontap,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 200, 230, 255),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 0,
                  offset: Offset(0, 1),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  widget.qari.name!,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
