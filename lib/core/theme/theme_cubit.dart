import 'package:bloc/bloc.dart';
import 'package:coffee_shop/core/theme/theme_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final themeKey = "THEME_KEY";

  ThemeCubit() : super(ThemeState(theme: AppTheme.themeCoffee));

  Future<void> changeTheme(String themeName) async {
    final sp = await SharedPreferences.getInstance();

    switch (themeName) {
      case AppTheme.keyCoffee:
        emit(state.copyWith(theme: AppTheme.themeCoffee));
    }

    sp.setString(themeKey, themeName);
  }

  Future<void> loadTheme() async {
    final sp = await SharedPreferences.getInstance();
    final themeName = sp.getString(themeKey) ?? AppTheme.keyCoffee;

    switch (themeName) {
      case AppTheme.keyCoffee:
        emit(state.copyWith(theme: AppTheme.themeCoffee));
      default:
        emit(state.copyWith(theme: AppTheme.themeCoffee));
    }
  }
}
