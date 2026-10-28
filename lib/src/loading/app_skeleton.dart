import 'package:flint_dart/ui.dart';
import '../theme/tokens.dart';

/// Shimmering lazy-loading skeleton component with pulsing wave effect.
class AppSkeleton extends StatelessComponent {
  AppSkeleton({
    this.width,
    this.height = 18,
    this.radius = EulogiaRadius.sm,
    this.dartStyle,
  });

  /// Skeleton formatted for single-line text placeholders.
  AppSkeleton.text({
    this.width = 120,
    this.height = 14,
    this.radius = EulogiaRadius.sm,
    this.dartStyle,
  });

  /// Skeleton formatted for circular avatars.
  AppSkeleton.avatar({
    double size = 40,
    this.dartStyle,
  })  : width = size,
        height = size,
        radius = EulogiaRadius.full;

  /// Skeleton formatted for dashboard or data cards.
  AppSkeleton.card({
    this.width,
    this.height = 140,
    this.radius = EulogiaRadius.md,
    this.dartStyle,
  });

  final Object? width;
  final Object? height;
  final double radius;
  final DartStyle? dartStyle;

  @override
  View build() {
    final tokenPanelMuted = ThemeToken.color('panelMuted');

    return Container(
      dartStyle: DartStyle(
        width: width,
        height: height,
        radius: radius,
        background: tokenPanelMuted,
        animation: 'euch-pulse 1.4s ease-in-out infinite',
      ).merge(dartStyle),
    );
  }

  /// Helper generating multiple rows of skeleton items.
  static FlintNode rows({int count = 3, double height = 48, double gap = 8}) {
    return Column(
      dartStyle: DartStyle(gap: gap),
      children: [
        for (var i = 0; i < count; i++)
          AppSkeleton(
            width: SizeValue.full,
            height: height,
            radius: EulogiaRadius.sm,
          ),
      ],
    );
  }

  /// Helper generating a grid of skeleton cards.
  static FlintNode grid({int count = 3, double height = 120, double gap = 16}) {
    return Grid(
      columns: '1fr',
      gap: gap,
      dartStyle: DartStyle(
        md: DartStyle(gridTemplateColumns: 'repeat(2, minmax(0, 1fr))'),
        lg: DartStyle(gridTemplateColumns: 'repeat(3, minmax(0, 1fr))'),
      ),
      children: [
        for (var i = 0; i < count; i++)
          AppSkeleton.card(height: height),
      ],
    );
  }
}
