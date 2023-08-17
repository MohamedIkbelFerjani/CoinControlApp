import 'package:flutter/material.dart';

class topNeuCard extends StatelessWidget {
  final String balance;
  final String income;
  final String expanse;
  topNeuCard(
      {required this.balance, required this.income, required this.expanse});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  ' B A L A N C E',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  balance,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text('Income',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[500])),
                            Text(income),
                          ],
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.arrow_downward,
                            color: Color.fromARGB(255, 224, 1, 1),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text('Expanse',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[500])),
                            Text(expanse),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0)
            ]),
      ),
    );
  }
}
