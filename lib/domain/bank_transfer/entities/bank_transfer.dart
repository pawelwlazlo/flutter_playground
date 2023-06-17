import 'package:equatable/equatable.dart';

class Przelew extends Equatable {
  final int transferId;
  final String odbiorca;
  final String tytulPrzelewu;
  final DateTime data;
  final DateTime dataKsiegowania;
  final String nrRachunku;
  final int bankId;

  const Przelew({
    required this.transferId,
    required this.odbiorca,
    required this.tytulPrzelewu,
    required this.data,
    required this.dataKsiegowania,
    required this.nrRachunku,
    required this.bankId,
  });

  Przelew copyWith({
    int? transferId,
    String? odbiorca,
    String? tytulPrzelewu,
    DateTime? data,
    DateTime? dataKsiegowania,
    String? nrRachunku,
    int? bankId,
  }) {
    return Przelew(
      transferId: transferId ?? this.transferId,
      odbiorca: odbiorca ?? this.odbiorca,
      tytulPrzelewu: tytulPrzelewu ?? this.tytulPrzelewu,
      data: data ?? this.data,
      dataKsiegowania: dataKsiegowania ?? this.dataKsiegowania,
      nrRachunku: nrRachunku ?? this.nrRachunku,
      bankId: bankId ?? this.bankId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'transferId': transferId,
      'odbiorca': odbiorca,
      'tytulPrzelewu': tytulPrzelewu,
      'data': data,
      'dataKsiegowania': dataKsiegowania,
      'nrRachunku': nrRachunku,
      'bankId': bankId,
    };
  }

  factory Przelew.fromMap(Map<String, dynamic> map) {
    return Przelew(
      transferId: map['transferId'] as int,
      odbiorca: map['odbiorca'] as String,
      tytulPrzelewu: map['tytulPrzelewu'] as String,
      data: map['data'] as DateTime,
      dataKsiegowania: map['dataKsiegowania'] as DateTime,
      nrRachunku: map['nrRachunku'] as String,
      bankId: map['bankId'] as int,
    );
  }

  @override
  List<Object?> get props => [transferId, odbiorca, tytulPrzelewu, data, dataKsiegowania, nrRachunku, bankId];


}

