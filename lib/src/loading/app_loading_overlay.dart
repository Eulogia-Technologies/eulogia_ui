import 'package:flint_dart/ui.dart';
import '../theme/tokens.dart';
import 'app_spinner.dart';

/// Fullscreen or container-level EasyLoading HUD overlay.
/// Displays a modern backdrop, circular spinner, and optional status message.
class AppLoadingOverlay extends StatelessComponent {
  AppLoadingOverlay({
    required this.loading,
    this.status,
    this.child,
    this.fullscreen = false,
  });

  final bool loading;
  final String? status;
  final FlintNode? child;
  final bool fullscreen;

  @override
  View build() {
    if (!loading) {
      return child ?? const FlintFragment([]);
    }

    final hud = Container(
      dartStyle: DartStyle(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        radius: EulogiaRadius.md,
        background: EulogiaColors.surfaceSolid,
        border: Border.all(color: EulogiaColors.borderDefault),
        display: Display.flex,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        gap: 12,
        shadow: const Shadow(
          y: 16,
          blur: 40,
          spread: -12,
          color: Color.rgba(0, 0, 0, 0.5),
        ),
      ),
      children: [
        AppSpinner(size: AppSpinnerSize.md),
        if (status != null)
          Text.p(
            status!,
            dartStyle: const DartStyle(
              fontSize: 13,
              fontWeight: 700,
              color: EulogiaColors.textPrimary,
              margin: EdgeInsets.zero,
            ),
          ),
      ],
    );

    final overlay = Container(
      dartStyle: DartStyle(
        position: fullscreen ? Position.fixed : Position.absolute,
        top: 0,
        right: 0,
        bottom: 0,
        left: 0,
        zIndex: 999,
        background: const Color.rgba(2, 6, 23, 0.65),
        backdropFilter: StyleFilter.blur(6),
        display: Display.flex,
        alignItems: AlignItems.center,
        justifyContent: JustifyContent.center,
      ),
      child: hud,
    );

    if (fullscreen || child == null) {
      return overlay;
    }

    return Container(
      dartStyle: const DartStyle(position: Position.relative),
      children: [
        child!,
        overlay,
      ],
    );
  }
}
