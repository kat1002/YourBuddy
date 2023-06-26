import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ThuNhapBox extends StatelessWidget {
  final double income;
  const ThuNhapBox({
    Key? key,
    required this.income,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 94,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 148,
              height: 94,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x2B000000),
                    blurRadius: 13,
                    offset: Offset(0, 2),
                    spreadRadius: 2,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 17,
            child: SizedBox(
              width: 148,
              height: 26,
              child: Text(
                'Thu nhập',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF232323),
                  fontSize: 14,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.42,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 47,
            child: SizedBox(
              width: 148,
              height: 30,
              child: Text(
                NumberFormat.simpleCurrency(name: 'VND', locale: "vi_VN")
                    .format(income),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF3BAE5B),
                  fontSize: 15,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.36,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
