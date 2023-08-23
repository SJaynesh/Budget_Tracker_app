import 'package:flutter/material.dart';

class AllSpendingPage extends StatefulWidget {
  const AllSpendingPage({super.key});

  @override
  State<AllSpendingPage> createState() => _AllSpendingPageState();
}

class _AllSpendingPageState extends State<AllSpendingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "All Spending",
        style: TextStyle(
          color: Colors.brown,
          fontSize: 22,
        ),
      ),
    );
  }
}
