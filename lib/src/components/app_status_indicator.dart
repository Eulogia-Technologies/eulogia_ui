import 'package:flint_dart/ui.dart';
import '../theme/tokens.dart';

enum AppStatusType {
  operational,
  degraded,
  offline,
  maintenance,
}

/// Unified Status Indicator component for the Eulogia Ecosystem design system.
/// Dynamically aware of light and dark themes using ecosystem design tokens.
class AppStatusIndicator extends StatelessComponent {
  AppStatusIndicator({
    required this.status,
    this.customLabel,
    this.compact = false,
  });

  final AppStatusType status;
  final String? customLabel;
  final bool compact;

  @override
  View build() {
    dynamic bg;
    Border border;
    dynamic dot;
    dynamic text;
    String defaultLabel;

    switch (status) {
      case AppStatusType.operational:
        bg = EulogiaColors.successBg;
        border = Border.all(color: EulogiaColors.successBorder);
        dot = EulogiaColors.success;
        text = ThemeToken.color('mint');
        defaultLabel = 'Operational';
        break;
      case AppStatusType.degraded:
        bg = EulogiaColors.warningBg;
        border = Border.all(color: EulogiaColors.warningBorder);
        dot = EulogiaColors.warning;
        text = ThemeToken.color('gold');
        defaultLabel = 'Degraded';
        break;
      case AppStatusType.offline:
        bg = EulogiaColors.dangerBg;
        border = Border.all(color: EulogiaColors.dangerBorder);
        dot = EulogiaColors.danger;
        text = ThemeToken.color('danger');
        defaultLabel = 'Offline';
        break;
      case AppStatusType.maintenance:
        bg = EulogiaColors.infoBg;
        border = Border.all(color: EulogiaColors.infoBorder);
        dot = EulogiaColors.info;
        text = const Color('#2563eb');
        defaultLabel = 'Maintenance';
        break;
    }

    final label = customLabel ?? defaultLabel;

    return Container(
      dartStyle: DartStyle(
        display: Display.inlineFlex,
        alignItems: AlignItems.center,
        gap: 6,
        padding: compact
            ? const EdgeInsets.symmetric(horizontal: 6, vertical: 2)
            : const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        radius: EulogiaRadius.full,
        background: bg,
        border: border,
      ),
      children: [
        Container(
          dartStyle: DartStyle(
            width: 6,
            height: 6,
            radius: EulogiaRadius.full,
            background: dot,
          ),
        ),
        if (!compact)
          Text.span(
            label,
            dartStyle: DartStyle(
              fontSize: 10.5,
              fontWeight: 700,
              color: text,
            ),
          ),
      ],
    );
  }
}
