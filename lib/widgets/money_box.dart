import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Money_Box extends StatelessWidget {
  final double account;
  final double income;
  final double expense;
  const Money_Box({
    Key? key,
    required this.account,
    required this.income,
    required this.expense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285,
      height: 90,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              width: 212,
              height: 30,
              child: Text(
                'Tài khoản',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.72,
                ),
              ),
            ),
          ),
          Positioned(
            left: 52,
            top: 45,
            child: SizedBox(
              width: 233,
              height: 40,
              child: Text(
                NumberFormat.simpleCurrency(name: 'VND', locale: "vi_VN")
                    .format(account),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF3BAE5B),
                  fontSize: 24,
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
