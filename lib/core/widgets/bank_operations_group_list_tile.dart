import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/data/models/bank_operation_model.dart';

class BankOperationsGroupListTile extends StatefulWidget {
  const BankOperationsGroupListTile(
      {super.key,
      required this.expansionTileTitle,
      required this.data,
      required this.trailingText,
      required this.trailingSumm});
  final String expansionTileTitle;
  final String trailingText;
  final String trailingSumm;

  final List<BankOperationModel> data;

  @override
  State<BankOperationsGroupListTile> createState() =>
      _BankOperationsGroupListTileState();
}

class _BankOperationsGroupListTileState
    extends State<BankOperationsGroupListTile> {
  @override
  Widget build(BuildContext context) {
    return expasionTitle();
  }

  Widget expasionTitle() {
    return ExpansionTile(
      trailing: Text('${widget.trailingText} : ${widget.trailingSumm}'),
      title: Text(widget.expansionTileTitle),
      children: widget.data
          .map((e) => ListTile(
                // value: false,
                // onChanged: (value) {},
                title: Text(e.summ.toString()),
                subtitle: Text(
                  'Date: ${e.date}',
                  maxLines: 1,
                ),
                trailing: Text('ID ${e.id}'),
              ))
          .toList(),
    );
  }
}
