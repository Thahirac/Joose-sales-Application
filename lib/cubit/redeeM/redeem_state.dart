part of 'redeem_cubit.dart';

@immutable
abstract class RedeemState {}

class Initial extends RedeemState {}


class Loading extends RedeemState {}

class Successfull extends RedeemState {

  final Purchasedetails? pdetails;

  Successfull(this.pdetails);
}

class Faild extends RedeemState {
  final String msg;
  Faild(this.msg);
}
