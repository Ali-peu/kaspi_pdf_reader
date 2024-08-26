class BankOperationModel {
  final String date;
  final double summ;
  final String typeOperation;
  final String purpose;
  final bool isPlus;


  BankOperationModel( 
      {required this.date,
      required this.summ,
      required this.isPlus,
      required this.typeOperation,
      required this.purpose});

  BankOperationModel copyWith(
      {String? date, double? summ, String? typeOperation, String? purpose}) {
    return BankOperationModel(
        date: date ?? this.date,
        isPlus: isPlus,
        summ: summ ?? this.summ,
        typeOperation: typeOperation ?? this.typeOperation,
        purpose: purpose ?? this.purpose);
  }
}
