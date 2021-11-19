// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';

import 'package:meta/meta.dart';

part 'pickuplist_state.dart';

class PickuplistCubit extends Cubit<PickuplistState> {
  PickuplistCubit({required this.url}) : super(PickuplistInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData(DateTime fromDate,DateTime toDate) async {
    emit(Fetching());
    try {
      final List data = await web.getPickUpList(fromDate: fromDate,toDate: toDate);
      emit(FetchCompleted(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}
