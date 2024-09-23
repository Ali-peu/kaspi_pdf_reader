import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/core/widgets/bank_operation_list_tile.dart';
import 'package:kaspi_pdf_reader/core/data/models/bank_operation_model.dart';

class BankOperationsGroupListTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return expasionTitle();
  }

  Widget expasionTitle() {
    return ExpansionTile(
      trailing: Text('$trailingText : $trailingSumm'),
      title: Text(expansionTileTitle),
      children: data
          .map((e) => BankOperationListTile(
                bankOperationModel: e,
              ))
          .toList(),
    );
  }
}
