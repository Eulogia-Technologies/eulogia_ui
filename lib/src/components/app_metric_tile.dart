import 'package:flint_dart/ui.dart';
import '../theme/tokens.dart';

/// Unified Metric Tile component for the Eulogia Ecosystem design system.
/// Light-mode and dark-mode aware via ecosystem design tokens.
class AppMetricTile extends StatelessComponent {
  AppMetricTile({
    required this.label,
    required this.value,
    this.sublabel,
    this.icon,
    this.accent = EulogiaColors.brandPrimary,
    this.badge,
    this.onClick,
    this.dartStyle,
  });

  final String label;
  final String value;
  final String? sublabel;
  final IconData? icon;
  final Color accent;
  final FlintNode? badge;
  final void Function(Object event)? onClick;
  final DartStyle? dartStyle;

  @override
  View build() {
    final tokenPanel = ThemeToken.color('panel');
    final tokenLine = ThemeToken.color('line');
    final tokenInk = ThemeToken.color('ink');
    final tokenMuted = ThemeToken.color('muted');

    return Container(
      props: {
        if (onClick != null) 'onClick': onClick,
      },
      dartStyle: DartStyle(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        radius: EulogiaRadius.md,
        background: tokenPanel,
        border: Border.all(color: tokenLine),
        display: Display.flex,
        flexDirection: FlexDirection.column,
        gap: 6,
        cursor: onClick != null ? Cursor.pointer : null,
        shadow: const Shadow(
          y: 4,
          blur: 16,
          spread: -4,
          color: Color.rgba(15, 23, 42, 0.04),
        ),
      ).merge(dartStyle),
      children: [
        Row(
          dartStyle: const DartStyle(
            display: Display.flex,
            justifyContent: JustifyContent.between,
            alignItems: AlignItems.center,
          ),
          children: [
            Row(
              dartStyle: const DartStyle(
                display: Display.flex,
                alignItems: AlignItems.center,
                gap: 6,
              ),
              children: [
                if (icon != null) Icon(icon!, size: 14, color: accent),
                Text.span(
                  label.toUpperCase(),
                  dartStyle: DartStyle(
                    fontSize: 11,
                    fontWeight: 700,
                    letterSpacing: 0.5,
                    color: tokenMuted,
                  ),
                ),
              ],
            ),
            if (badge != null) badge!,
          ],
        ),
        Text.h3(
          value,
          dartStyle: DartStyle(
            fontSize: 22,
            fontWeight: 800,
            color: tokenInk,
            margin: EdgeInsets.zero,
            lineHeight: 1.1,
          ),
        ),
        if (sublabel != null)
          Text.p(
            sublabel!,
            dartStyle: DartStyle(
              fontSize: 11,
              color: tokenMuted,
              margin: EdgeInsets.zero,
            ),
          ),
      ],
    );
  }
}
