import 'package:bloc/bloc.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:meta/meta.dart';

part 'farmeditor_state.dart';

class FarmeditorCubit extends Cubit<FarmeditorState> {
  FarmeditorCubit({required this.url}) : super(FarmeditorInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData() async {
    emit(Fetching());
     try {
    //   final List<Map> data = await web.getFarmEditor();
    //   emit(DataReady(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}
