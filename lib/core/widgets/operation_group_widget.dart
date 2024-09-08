import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/core/global_values/global_icons_map.dart';
import 'package:kaspi_pdf_reader/data/models/operation_groups_model/operation_groups_model.dart';

class OperationGroupWidget extends StatelessWidget {
  final OperationGroupsModel model;
  const OperationGroupWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.amber),
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(iconsMap[model.id]),
          Text(model.name),
          Text(model.summ.toString()),
        ],
      ),
    );
  }
}
