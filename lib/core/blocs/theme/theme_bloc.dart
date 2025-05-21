import 'package:bloc/bloc.dart';
import 'package:burning_bros_interview/core/services/local_storage_service.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'theme_event.dart';

part 'theme_state.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(isDarkMode: false)) {
    on<InitialThemeEvent>(onInitialTheme);
    on<ChangeThemeEvent>(onChangeTheme);
  }

  void onInitialTheme(InitialThemeEvent event, Emitter<ThemeState> emit) {
    final currentTheme = LocalStorageService.getBool('isDarkMode');
    emit(ThemeState(isDarkMode: currentTheme));
  }

  Future<void> onChangeTheme(
      ChangeThemeEvent event, Emitter<ThemeState> emit) async {
    await LocalStorageService.setBool('isDarkMode', event.isDarkMode);
    emit(state.copyWith(isDarkMode: event.isDarkMode));
  }
}
