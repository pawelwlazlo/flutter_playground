part of 'bank_transfer_cubit.dart';

enum BankTransferStateEnum {
  bankTransferStateInitial,
  bankTransferStateTransactionCreated,
  bankTransferStateTransferInProgress,
  bankTransferStateTransferCompleted, bankTransferEnded, bankTransferStateTransferFailed, bankTransferStateTransferEnded,
}

enum BankTransferStateErrorEnum {
  bankTransferStateErrorInvalidAccountNumber,
  bankTransferStateErrorInvalidAmount,
  bankTransferStateErrorInvalidTitle,
  bankTransferStateErrorInvalidAccountHolderName,
  bankTransferStateErrorInvalidRecipientAddress,
}

class AccountNumber extends FormzInput<String, BankTransferStateErrorEnum> {
  const AccountNumber.dirty([String value = '']) : super.dirty(value);

  const AccountNumber.pure([String value = '']) : super.pure(value);

  @override
  BankTransferStateErrorEnum? validator(String value) {
    return value.length == 26
        ? null
        : BankTransferStateErrorEnum.bankTransferStateErrorInvalidAccountNumber;
  }
}

class RecipientName extends FormzInput<String, BankTransferStateErrorEnum> {
  const RecipientName.dirty([String value = '']) : super.dirty(value);

  const RecipientName.pure([String value = '']) : super.pure(value);

  @override
  BankTransferStateErrorEnum? validator(String value) {
    return value.isNotEmpty
        ? null
        : BankTransferStateErrorEnum
        .bankTransferStateErrorInvalidAccountHolderName;
  }
}

class Title extends FormzInput<String, BankTransferStateErrorEnum> {
  const Title.dirty([String value = '']) : super.dirty(value);

  const Title.pure([String value = '']) : super.pure(value);

  @override
  BankTransferStateErrorEnum? validator(String value) {
    return value.isNotEmpty
        ? null
        : BankTransferStateErrorEnum.bankTransferStateErrorInvalidTitle;
  }
}

class RecipientAddress extends FormzInput<String, BankTransferStateErrorEnum> {
  const RecipientAddress.dirty([String value = '']) : super.dirty(value);

  const RecipientAddress.pure([String value = '']) : super.pure(value);

  @override
  BankTransferStateErrorEnum? validator(String value) {
    return value.isNotEmpty
        ? null
        : BankTransferStateErrorEnum.bankTransferStateErrorInvalidRecipientAddress;
  }
}

class BankTransferState extends Equatable {
  final BankTransferStateEnum status;

  final List<BankTransferStateModel> transactions;
  final RecipientName recipientName;
  final Title title;
  final DateTime? accountingDate;
  final AccountNumber accountNumber;
  final Decimal? amount;
  final BankAccount? fromAccount;
  final RecipientAddress recipientAddress;
  final bool formzStatus;


  factory BankTransferState.initial() {
    return const BankTransferState(
      transactions: [],
      status: BankTransferStateEnum.bankTransferStateInitial,
      formzStatus: false,
    );
  }

  const BankTransferState({
    required this.status,
    required this.transactions,
    required this.formzStatus,
    this.recipientName = const RecipientName.pure(''),
    this.title = const Title.pure(''),
    this.accountingDate,
    this.accountNumber = const AccountNumber.pure(''),
    this.amount,
    this.fromAccount,
    this.recipientAddress = const RecipientAddress.pure(''),
  });

  @override
  List<Object?> get props =>
      [
        status,
        transactions,
        recipientName,
        title,
        accountingDate,
        accountNumber,
        amount,
        fromAccount,
        recipientAddress,
        formzStatus
      ];

  BankTransferState copyWith({
    BankTransferStateEnum? status,
    List<BankTransferStateModel>? transactions,
    RecipientName? recipientName,
    Title? title,
    DateTime? accountingDate,
    AccountNumber? accountNumber,
    Decimal? amount,
    BankAccount? fromAccount,
    RecipientAddress? recipientAddress,
    bool? formzStatus,
  }) {
    return BankTransferState(
      status: status ?? this.status,
      transactions: transactions ?? this.transactions,
      recipientName: recipientName ?? this.recipientName,
      title: title ?? this.title,
      accountingDate: accountingDate ?? this.accountingDate,
      accountNumber: accountNumber ?? this.accountNumber,
      amount: amount ?? this.amount,
      fromAccount: fromAccount ?? this.fromAccount,
      recipientAddress: recipientAddress ?? this.recipientAddress,
      formzStatus: formzStatus ?? this.formzStatus,
    );
  }
}
