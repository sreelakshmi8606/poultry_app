import 'package:bloc/bloc.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:meta/meta.dart';

part 'hatcherytransactioneditor_state.dart';

class HatcherytransactioneditorCubit extends Cubit<HatcherytransactioneditorState> {
  HatcherytransactioneditorCubit({required this.url}) : super(HatcherytransactioneditorInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData() async {
    emit(Fetching());
    try {
      final List<Map> data = await web.getTransactionHatcheryEditor();
      emit(DataReady(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}
