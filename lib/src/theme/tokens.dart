import 'package:flint_dart/ui.dart';

/// Design tokens for the Eulogia Ecosystem design system.
/// Changing tokens here impacts all commercial apps (SchoolHQ, Stokash, EUCloudHost, Eulogia OS).
abstract final class EulogiaColors {
  // Brand & Accents
  static const Color brandPrimary = Color('#10b981');
  static const Color brandHover = Color('#059669');
  static const Color brandActive = Color('#047857');
  static const Color brandMuted = Color.rgba(16, 185, 129, 0.15);

  // Status Tones
  static const Color success = Color('#10b981');
  static const Color successBg = Color.rgba(16, 185, 129, 0.12);
  static const Color successBorder = Color.rgba(16, 185, 129, 0.28);

  static const Color warning = Color('#f59e0b');
  static const Color warningBg = Color.rgba(245, 158, 11, 0.12);
  static const Color warningBorder = Color.rgba(245, 158, 11, 0.28);

  static const Color danger = Color('#ef4444');
  static const Color dangerBg = Color.rgba(239, 68, 68, 0.12);
  static const Color dangerBorder = Color.rgba(239, 68, 68, 0.28);

  static const Color info = Color('#3b82f6');
  static const Color infoBg = Color.rgba(59, 130, 246, 0.12);
  static const Color infoBorder = Color.rgba(59, 130, 246, 0.28);

  // Surface & Panels (Dark Luxury Eulogia Style)
  static const Color surfaceGlass = Color.rgba(18, 26, 23, 0.75);
  static const Color surfaceSolid = Color('#121a17');
  static const Color surfaceMuted = Color.rgba(255, 255, 255, 0.03);
  static const Color borderDefault = Color.rgba(36, 52, 45, 0.7);
  static const Color borderSubtle = Color.rgba(255, 255, 255, 0.08);

  // Text
  static const Color textPrimary = Color('#f1f5f9');
  static const Color textSecondary = Color('#94a3b8');
  static const Color textMuted = Color('rgba(241, 245, 249, 0.55)');
}

/// EUCloudHost-exact colors and tokens for light and dark admin workspace designs.
abstract final class EuThemeColors {
  // EUCloudHost Light Theme
  static const Color lightBg = Color('#f5fbf8');
  static const Color lightInk = Color('#0f172a');
  static const Color lightMuted = Color('#526170');
  static const Color lightLine = Color.rgba(15, 23, 42, 0.10);
  static const Color lightPanel = Colors.white;
  static const Color lightPanelMuted = Color('#f8fafc');
  static const Color lightAction = Color('#0f172a');
  static const Color lightActionHover = Color('#1e293b');
  static const Color lightActionSoft = Color.rgba(15, 23, 42, 0.06);
  static const Color lightEmerald = Color('#10b981');
  static const Color lightTeal = Color('#111827');

  // EUCloudHost Dark Theme
  static const Color darkBg = Color('#020617');
  static const Color darkInk = Color('#f8fafc');
  static const Color darkMuted = Color('#b6c3d6');
  static const Color darkLine = Color.rgba(148, 163, 184, 0.18);
  static const Color darkPanel = Color.rgba(10, 18, 33, 0.96);
  static const Color darkPanelMuted = Color.rgba(15, 27, 46, 0.90);
  static const Color darkAction = Color('#22c55e');
  static const Color darkActionHover = Color('#4ade80');
  static const Color darkActionSoft = Color.rgba(34, 197, 94, 0.16);
  static const Color darkActionInk = Color('#052e16');
  static const Color darkEmerald = Color('#34d399');
}

abstract final class EulogiaRadius {
  static const double sm = 6.0;
  static const double md = 10.0;
  static const double lg = 16.0;
  static const double full = 999.0;
}
