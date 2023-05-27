import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'api_cubit_state.dart';

class ApiCubitCubit extends Cubit<ApiCubitState> {
  ApiCubitCubit() : super(ApiCubitInitial());
}
