import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(ThemeMode.dark));

  void toggleTheme(){
    if(state.mode == ThemeMode.dark){
      emit(ThemeState(ThemeMode.light));
    }else{
      emit(ThemeState(ThemeMode.dark));
    }
  }
}
