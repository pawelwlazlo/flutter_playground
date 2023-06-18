import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

const ing = Color(0xFFFF6201);
const alior = Color(0xFFA41A42);
const paribas = Color(0xFF19905C);


CustomColors lightCustomColors = const CustomColors(
  sourceIng: Color(0xFFFF6201),
  ing: Color(0xFFA53C00),
  onIng: Color(0xFFFFFFFF),
  ingContainer: Color(0xFFFFDBCD),
  onIngContainer: Color(0xFF360F00),
  sourceAlior: Color(0xFFA41A42),
  alior: Color(0xFFB1264B),
  onAlior: Color(0xFFFFFFFF),
  aliorContainer: Color(0xFFFFD9DD),
  onAliorContainer: Color(0xFF400013),
  sourceParibas: Color(0xFF19905C),
  paribas: Color(0xFF006D43),
  onParibas: Color(0xFFFFFFFF),
  paribasContainer: Color(0xFF8DF8BA),
  onParibasContainer: Color(0xFF002111),
);

CustomColors darkCustomColors = const CustomColors(
  sourceIng: Color(0xFFFF6201),
  ing: Color(0xFFFFB597),
  onIng: Color(0xFF591D00),
  ingContainer: Color(0xFF7E2C00),
  onIngContainer: Color(0xFFFFDBCD),
  sourceAlior: Color(0xFFA41A42),
  alior: Color(0xFFFFB2BC),
  onAlior: Color(0xFF670023),
  aliorContainer: Color(0xFF900335),
  onAliorContainer: Color(0xFFFFD9DD),
  sourceParibas: Color(0xFF19905C),
  paribas: Color(0xFF71DBA0),
  onParibas: Color(0xFF003920),
  paribasContainer: Color(0xFF005231),
  onParibasContainer: Color(0xFF8DF8BA),
);



/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceIng,
    required this.ing,
    required this.onIng,
    required this.ingContainer,
    required this.onIngContainer,
    required this.sourceAlior,
    required this.alior,
    required this.onAlior,
    required this.aliorContainer,
    required this.onAliorContainer,
    required this.sourceParibas,
    required this.paribas,
    required this.onParibas,
    required this.paribasContainer,
    required this.onParibasContainer,
  });

  final Color? sourceIng;
  final Color? ing;
  final Color? onIng;
  final Color? ingContainer;
  final Color? onIngContainer;
  final Color? sourceAlior;
  final Color? alior;
  final Color? onAlior;
  final Color? aliorContainer;
  final Color? onAliorContainer;
  final Color? sourceParibas;
  final Color? paribas;
  final Color? onParibas;
  final Color? paribasContainer;
  final Color? onParibasContainer;

  @override
  CustomColors copyWith({
    Color? sourceIng,
    Color? ing,
    Color? onIng,
    Color? ingContainer,
    Color? onIngContainer,
    Color? sourceAlior,
    Color? alior,
    Color? onAlior,
    Color? aliorContainer,
    Color? onAliorContainer,
    Color? sourceParibas,
    Color? paribas,
    Color? onParibas,
    Color? paribasContainer,
    Color? onParibasContainer,
  }) {
    return CustomColors(
      sourceIng: sourceIng ?? this.sourceIng,
      ing: ing ?? this.ing,
      onIng: onIng ?? this.onIng,
      ingContainer: ingContainer ?? this.ingContainer,
      onIngContainer: onIngContainer ?? this.onIngContainer,
      sourceAlior: sourceAlior ?? this.sourceAlior,
      alior: alior ?? this.alior,
      onAlior: onAlior ?? this.onAlior,
      aliorContainer: aliorContainer ?? this.aliorContainer,
      onAliorContainer: onAliorContainer ?? this.onAliorContainer,
      sourceParibas: sourceParibas ?? this.sourceParibas,
      paribas: paribas ?? this.paribas,
      onParibas: onParibas ?? this.onParibas,
      paribasContainer: paribasContainer ?? this.paribasContainer,
      onParibasContainer: onParibasContainer ?? this.onParibasContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceIng: Color.lerp(sourceIng, other.sourceIng, t),
      ing: Color.lerp(ing, other.ing, t),
      onIng: Color.lerp(onIng, other.onIng, t),
      ingContainer: Color.lerp(ingContainer, other.ingContainer, t),
      onIngContainer: Color.lerp(onIngContainer, other.onIngContainer, t),
      sourceAlior: Color.lerp(sourceAlior, other.sourceAlior, t),
      alior: Color.lerp(alior, other.alior, t),
      onAlior: Color.lerp(onAlior, other.onAlior, t),
      aliorContainer: Color.lerp(aliorContainer, other.aliorContainer, t),
      onAliorContainer: Color.lerp(onAliorContainer, other.onAliorContainer, t),
      sourceParibas: Color.lerp(sourceParibas, other.sourceParibas, t),
      paribas: Color.lerp(paribas, other.paribas, t),
      onParibas: Color.lerp(onParibas, other.onParibas, t),
      paribasContainer: Color.lerp(paribasContainer, other.paribasContainer, t),
      onParibasContainer: Color.lerp(onParibasContainer, other.onParibasContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///   * [CustomColors.sourceIng]
  ///   * [CustomColors.ing]
  ///   * [CustomColors.onIng]
  ///   * [CustomColors.ingContainer]
  ///   * [CustomColors.onIngContainer]
  ///   * [CustomColors.sourceAlior]
  ///   * [CustomColors.alior]
  ///   * [CustomColors.onAlior]
  ///   * [CustomColors.aliorContainer]
  ///   * [CustomColors.onAliorContainer]
  ///   * [CustomColors.sourceParibas]
  ///   * [CustomColors.paribas]
  ///   * [CustomColors.onParibas]
  ///   * [CustomColors.paribasContainer]
  ///   * [CustomColors.onParibasContainer]
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
      sourceIng: sourceIng!.harmonizeWith(dynamic.primary),
      ing: ing!.harmonizeWith(dynamic.primary),
      onIng: onIng!.harmonizeWith(dynamic.primary),
      ingContainer: ingContainer!.harmonizeWith(dynamic.primary),
      onIngContainer: onIngContainer!.harmonizeWith(dynamic.primary),
      sourceAlior: sourceAlior!.harmonizeWith(dynamic.primary),
      alior: alior!.harmonizeWith(dynamic.primary),
      onAlior: onAlior!.harmonizeWith(dynamic.primary),
      aliorContainer: aliorContainer!.harmonizeWith(dynamic.primary),
      onAliorContainer: onAliorContainer!.harmonizeWith(dynamic.primary),
      sourceParibas: sourceParibas!.harmonizeWith(dynamic.primary),
      paribas: paribas!.harmonizeWith(dynamic.primary),
      onParibas: onParibas!.harmonizeWith(dynamic.primary),
      paribasContainer: paribasContainer!.harmonizeWith(dynamic.primary),
      onParibasContainer: onParibasContainer!.harmonizeWith(dynamic.primary),
    );
  }
}