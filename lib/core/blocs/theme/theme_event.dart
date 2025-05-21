part of 'theme_bloc.dart';

class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class InitialThemeEvent extends ThemeEvent {
  InitialThemeEvent();

  @override
  List<Object?> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  final bool isDarkMode;

  ChangeThemeEvent({required this.isDarkMode});

  @override
  List<Object?> get props => [isDarkMode];
}
