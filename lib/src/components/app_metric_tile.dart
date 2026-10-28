import 'package:flint_dart/ui.dart';
import '../theme/tokens.dart';

/// Unified Metric Tile component for the Eulogia Ecosystem design system.
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
    return Container(
      props: {
        if (onClick != null) 'onClick': onClick,
      },
      dartStyle: DartStyle(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        radius: EulogiaRadius.md,
        background: EulogiaColors.surfaceGlass,
        border: Border.all(color: EulogiaColors.borderDefault),
        display: Display.flex,
        flexDirection: FlexDirection.column,
        gap: 6,
        cursor: onClick != null ? Cursor.pointer : null,
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
                  dartStyle: const DartStyle(
                    fontSize: 11,
                    fontWeight: 700,
                    letterSpacing: 0.5,
                    color: EulogiaColors.textSecondary,
                  ),
                ),
              ],
            ),
            if (badge != null) badge!,
          ],
        ),
        Text.h3(
          value,
          dartStyle: const DartStyle(
            fontSize: 22,
            fontWeight: 800,
            color: EulogiaColors.textPrimary,
            margin: EdgeInsets.zero,
            lineHeight: 1.1,
          ),
        ),
        if (sublabel != null)
          Text.p(
            sublabel!,
            dartStyle: const DartStyle(
              fontSize: 11,
              color: EulogiaColors.textMuted,
              margin: EdgeInsets.zero,
            ),
          ),
      ],
    );
  }
}
