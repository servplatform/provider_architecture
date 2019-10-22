import 'dart:async';

import 'package:provider_start/core/enums/theme_type.dart';
import 'package:provider_start/core/models/platform_theme.dart';
import 'package:provider_start/core/services/theme/theme_service.dart';
import 'package:provider_start/ui/shared/themes.dart';

/// Service that is responsible for changing the theme of the app.
class ThemeServiceImpl implements ThemeService {
  final _themeController = StreamController<PlatformThemeData>();

  final _availableMaterialThemes = materialThemes;
  final _availableCuepertinoThemes = cupertinoThemes;

  @override
  Stream<PlatformThemeData> get theme$ => _themeController.stream;

  ThemeServiceImpl(ThemeType theme) {
    if (theme != null)
      _emitNewTheme(theme);
    else
      _emitDefaultTheme();
  }

  @override
  void changeTheme(ThemeType theme) {
    _emitNewTheme(theme);
  }

  void _emitNewTheme(ThemeType theme) {
    final materialThemeToApply = _availableMaterialThemes[theme];
    final cupertinoThemeToApply = _availableCuepertinoThemes[theme];

    final platformThemeToApply = PlatformThemeData(
      materialThemeData: materialThemeToApply,
      cupertinoThemeData: cupertinoThemeToApply,
    );

    _themeController.add(platformThemeToApply);
  }

  void _emitDefaultTheme() {
    final materialThemeToApply = _availableMaterialThemes[primaryMaterialTheme];
    final cupertinoThemeToApply =
        _availableCuepertinoThemes[primaryCupertinoTheme];

    final platformThemeToApply = PlatformThemeData(
      materialThemeData: materialThemeToApply,
      cupertinoThemeData: cupertinoThemeToApply,
    );

    _themeController.add(platformThemeToApply);
  }
}
