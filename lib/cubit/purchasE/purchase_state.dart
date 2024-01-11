part of 'purchase_cubit.dart';


@immutable
abstract class PurchaseState {}

class Initial extends PurchaseState {}


class Loading extends PurchaseState {}

class Successfull extends PurchaseState {

  final Purchasedetails? pdetails;

  Successfull(this.pdetails);
}

class Faild extends PurchaseState {
  final String msg;
  Faild(this.msg);
}
