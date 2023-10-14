import 'package:bloc/bloc.dart';

class StringCubit extends Cubit<String> {
  StringCubit():super("");

 void setString(String newString) => emit(newString);
}