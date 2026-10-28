import 'package:flint_dart/ui.dart';
import '../theme/tokens.dart';

enum AppStatusType {
  operational,
  degraded,
  offline,
  maintenance,
}

/// Unified Status Indicator component for the Eulogia Ecosystem design system.
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
    Color bg;
    Color border;
    Color dot;
    Color text;
    String defaultLabel;

    switch (status) {
      case AppStatusType.operational:
        bg = EulogiaColors.successBg;
        border = EulogiaColors.successBorder;
        dot = EulogiaColors.success;
        text = const Color('#34d399');
        defaultLabel = 'Operational';
        break;
      case AppStatusType.degraded:
        bg = EulogiaColors.warningBg;
        border = EulogiaColors.warningBorder;
        dot = EulogiaColors.warning;
        text = const Color('#fbbf24');
        defaultLabel = 'Degraded';
        break;
      case AppStatusType.offline:
        bg = EulogiaColors.dangerBg;
        border = EulogiaColors.dangerBorder;
        dot = EulogiaColors.danger;
        text = const Color('#f87171');
        defaultLabel = 'Offline';
        break;
      case AppStatusType.maintenance:
        bg = EulogiaColors.infoBg;
        border = EulogiaColors.infoBorder;
        dot = EulogiaColors.info;
        text = const Color('#60a5fa');
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
        border: Border.all(color: border),
      ),
      children: [
        Container(
          dartStyle: DartStyle(
            width: 6,
            height: 6,
            radius: 999,
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
