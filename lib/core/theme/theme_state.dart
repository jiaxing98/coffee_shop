part of 'theme_cubit.dart';

@immutable
final class ThemeState extends Equatable {
  final MapEntry<String, ThemeData> theme;

  const ThemeState({required this.theme});

  ThemeState copyWith({
    MapEntry<String, ThemeData>? theme,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object> get props => [theme];
}
