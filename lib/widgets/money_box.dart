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
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 10,
                  spreadRadius: 0.5)
            ],
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.wallet,
                      color: Colors.orange,
                      size: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Tổng tài khoản\n' +
                          NumberFormat.simpleCurrency(
                                  name: 'VND', locale: "vi_VN")
                              .format(account),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tài chính',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Thu nhập:\n' +
                        NumberFormat.simpleCurrency(
                                name: 'VND', locale: "vi_VN")
                            .format(income),
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                      'Đã chi:\n' +
                          NumberFormat.simpleCurrency(
                                  name: 'VND', locale: "vi_VN")
                              .format(expense),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          )),
    );
  }
}
