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
    Color bg;
    Border border;
    Color text;
    Color dotColor;

    switch (variant) {
      case AppBadgeVariant.success:
        bg = EulogiaColors.successBg;
        border = Border.all(color: EulogiaColors.successBorder);
        text = const Color('#34d399');
        dotColor = EulogiaColors.success;
        break;
      case AppBadgeVariant.warning:
        bg = EulogiaColors.warningBg;
        border = Border.all(color: EulogiaColors.warningBorder);
        text = const Color('#fbbf24');
        dotColor = EulogiaColors.warning;
        break;
      case AppBadgeVariant.danger:
        bg = EulogiaColors.dangerBg;
        border = Border.all(color: EulogiaColors.dangerBorder);
        text = const Color('#f87171');
        dotColor = EulogiaColors.danger;
        break;
      case AppBadgeVariant.info:
        bg = EulogiaColors.infoBg;
        border = Border.all(color: EulogiaColors.infoBorder);
        text = const Color('#60a5fa');
        dotColor = EulogiaColors.info;
        break;
      case AppBadgeVariant.brand:
        bg = EulogiaColors.brandMuted;
        border = Border.all(color: const Color.rgba(16, 185, 129, 0.4));
        text = const Color('#34d399');
        dotColor = EulogiaColors.brandPrimary;
        break;
      case AppBadgeVariant.neutral:
        bg = EulogiaColors.surfaceMuted;
        border = Border.all(color: EulogiaColors.borderSubtle);
        text = EulogiaColors.textSecondary;
        dotColor = EulogiaColors.textSecondary;
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
            radius: 999,
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
          fontWeight: 600,
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
