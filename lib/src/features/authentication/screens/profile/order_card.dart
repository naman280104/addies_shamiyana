import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  final String date;
  final double amount;
  final List<String> items;

  const OrderCard({required this.date, required this.amount, required this.items});

  @override
  _OrderCardState createState() => _OrderCardState();
}


class _OrderCardState extends State<OrderCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(widget.date),
            subtitle: Text('Order Amount: \$${widget.amount.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded) ...[
            for (String item in widget.items)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(item),
              )
          ]
        ],
      ),
    );
  }
}
