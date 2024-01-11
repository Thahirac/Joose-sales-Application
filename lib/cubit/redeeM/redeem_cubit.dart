import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:joosesales/models/purchase_dtls_class.dart';
import 'package:joosesales/repository/purchaseRepo.dart';
import 'package:meta/meta.dart';
import 'package:result_type/result_type.dart';

part 'redeem_state.dart';

class RedeemCubit extends Cubit<RedeemState> {

  Purchasedetails? pdetails;


  RedeemCubit(this.dashBordRepository) : super(Initial());
  final DashBordRepository dashBordRepository;


  Future<void> redeemdetails(String? secretkey,) async {
    emit(Loading());
    Result? result = await dashBordRepository.redeemdetails(secretkey);
    if (result!.isSuccess) {


      pdetails = Purchasedetails(
        id: result.success["id"],
        name: result.success["name"],
        userId: result.success["user_id"],
        userSecret: result.success["user_secret"],
        purchaseDate: result.success["purchase_date"],
        storeId: result.success["store_id"],
        quantity: result.success["quantity"],
        purchaseStatus: result.success["purchase_status"],
        updatedAt: result.success["updated_at"],
        qrFileNameUrl: result.success["qr_file_name_url"],
      );

      emit(Successfull(pdetails));
    }
    else {
      emit(Faild(result.failure));
    }
  }
}






