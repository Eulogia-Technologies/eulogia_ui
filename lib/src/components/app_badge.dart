import 'package:flint_dart/ui.dart';
import '../theme/tokens.dart';

enum AppBadgeVariant {
  success,
  warning,
  danger,
  info,
  brand,
  neutral,
}

enum AppBadgeSize {
  sm,
  md,
}

/// Unified Badge / Pill indicator component for the Eulogia Ecosystem design system.
/// Dynamically aware of light and dark themes using ecosystem design tokens.
class AppBadge extends StatelessComponent {
  AppBadge({
    required this.label,
    this.variant = AppBadgeVariant.neutral,
    this.size = AppBadgeSize.sm,
    this.showDot = false,
    this.icon,
    this.dartStyle,
  });

  final String label;
  final AppBadgeVariant variant;
  final AppBadgeSize size;
  final bool showDot;
  final IconData? icon;
  final DartStyle? dartStyle;

  @override
  View build() {
    dynamic bg;
    Border border;
    dynamic text;
    dynamic dotColor;

    final tokenLine = ThemeToken.color('line');
    final tokenPanelMuted = ThemeToken.color('panelMuted');
    final tokenMuted = ThemeToken.color('muted');

    switch (variant) {
      case AppBadgeVariant.success:
        bg = EulogiaColors.successBg;
        border = Border.all(color: EulogiaColors.successBorder);
        text = ThemeToken.color('mint');
        dotColor = ThemeToken.color('mint');
        break;
      case AppBadgeVariant.warning:
        bg = EulogiaColors.warningBg;
        border = Border.all(color: EulogiaColors.warningBorder);
        text = ThemeToken.color('gold');
        dotColor = ThemeToken.color('gold');
        break;
      case AppBadgeVariant.danger:
        bg = EulogiaColors.dangerBg;
        border = Border.all(color: EulogiaColors.dangerBorder);
        text = ThemeToken.color('danger');
        dotColor = ThemeToken.color('danger');
        break;
      case AppBadgeVariant.info:
        bg = EulogiaColors.infoBg;
        border = Border.all(color: EulogiaColors.infoBorder);
        text = const Color('#2563eb');
        dotColor = const Color('#2563eb');
        break;
      case AppBadgeVariant.brand:
        bg = EulogiaColors.brandMuted;
        border = Border.all(color: const Color.rgba(16, 185, 129, 0.4));
        text = ThemeToken.color('teal');
        dotColor = EulogiaColors.brandPrimary;
        break;
      case AppBadgeVariant.neutral:
        bg = tokenPanelMuted;
        border = Border.all(color: tokenLine);
        text = tokenMuted;
        dotColor = tokenMuted;
        break;
    }

    final double fontSize = size == AppBadgeSize.sm ? 10.5 : 12.0;
    final EdgeInsets padding = size == AppBadgeSize.sm
        ? const EdgeInsets.symmetric(horizontal: 8, vertical: 3)
        : const EdgeInsets.symmetric(horizontal: 10, vertical: 5);

    final List<FlintNode> badgeChildren = [];

    if (showDot) {
      badgeChildren.add(
        Container(
          dartStyle: DartStyle(
            width: 6,
            height: 6,
            radius: EulogiaRadius.full,
            background: dotColor,
            margin: const EdgeInsets.only(right: 6),
          ),
        ),
      );
    }

    if (icon != null) {
      badgeChildren.add(
        Icon(
          icon!,
          size: size == AppBadgeSize.sm ? 11 : 13,
          color: text,
          dartStyle: const DartStyle(margin: EdgeInsets.only(right: 4)),
        ),
      );
    }

    badgeChildren.add(
      Text.span(
        label,
        dartStyle: DartStyle(
          fontSize: fontSize,
          fontWeight: 700,
          color: text,
          letterSpacing: 0.3,
        ),
      ),
    );

    return Container(
      dartStyle: DartStyle(
        display: Display.inlineFlex,
        alignItems: AlignItems.center,
        padding: padding,
        background: bg,
        border: border,
        radius: EulogiaRadius.full,
      ).merge(dartStyle),
      children: badgeChildren,
    );
  }
}
