import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider_start/core/constant/animations.dart';
import 'package:provider_start/core/models/platform_theme.dart';
import 'package:provider_start/core/services/api/api_service.dart';
import 'package:provider_start/locator.dart';
import 'package:provider_start/ui/views/main_view.dart';

/// A widget that will be shown as the first page when
/// the app is loaded for the first time.
///   - Animations are flare animations https://www.2dimensions.com/about-flare
///   - SplashView will navigated to the `next` page when `until`
///     function is finished
///   - The animation will always finish even if `until` has finished before
class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _api = locator<ApiService>();

    final theme = Provider.of<PlatformThemeData>(context);
    final targetPlatform = Theme.of(context).platform;
    final backgroundColor = targetPlatform == TargetPlatform.android
        ? theme.materialThemeData.primaryColor
        : theme.cupertinoThemeData.primaryColor;

    return SplashScreen.navigate(
      backgroundColor: backgroundColor,
      width: 100.0,
      name: Animations.loader,
      next: MainView(),
      until: () async {
        await _api.init();
      },
      loopAnimation: Animations.start_name,
    );
  }
}
