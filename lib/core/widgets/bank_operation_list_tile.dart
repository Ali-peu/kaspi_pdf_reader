import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/data/models/bank_operation_model.dart';

class BankOperationListTile extends StatelessWidget {
  final BankOperationModel bankOperationModel;
  const BankOperationListTile({super.key, required this.bankOperationModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // value: false,
      // onChanged: (value) {},
      title: Text('Summ: ${bankOperationModel.summ}'),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date: ${bankOperationModel.date}',
            maxLines: 1,
          ),
          Text(
            'Purpose: ${bankOperationModel.purpose}',
            maxLines: 1,
          ),
          Text(
            'TypeOperation: ${bankOperationModel.typeOperation}',
            maxLines: 1,
          ),
        ],
      ),
      trailing: Text('ID ${bankOperationModel.id}'),
    );
  }
}
