import 'package:flint_dart/ui.dart';
import '../theme/tokens.dart';

enum AppSpinnerSize {
  xs,
  sm,
  md,
  lg,
}

/// Circular spinner loader.
class AppSpinner extends StatelessComponent {
  AppSpinner({
    this.size = AppSpinnerSize.md,
    this.color = EulogiaColors.brandPrimary,
    this.strokeWidth = 2.5,
  });

  final AppSpinnerSize size;
  final Color color;
  final double strokeWidth;

  @override
  View build() {
    final double dimension = switch (size) {
      AppSpinnerSize.xs => 14.0,
      AppSpinnerSize.sm => 18.0,
      AppSpinnerSize.md => 26.0,
      AppSpinnerSize.lg => 38.0,
    };

    return Container(
      dartStyle: DartStyle(
        width: dimension,
        height: dimension,
        radius: EulogiaRadius.full,
        border: Border.all(color: const Color.rgba(16, 185, 129, 0.2), width: strokeWidth),
        borderTop: Border(color: color, width: strokeWidth),
        animation: 'euch-orbit 0.8s linear infinite',
      ),
    );
  }
}

