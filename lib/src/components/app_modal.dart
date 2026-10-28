import 'package:flint_dart/ui.dart';
import '../theme/tokens.dart';

enum AppModalSize {
  sm,
  md,
  lg,
  xl,
}

/// Unified accessible Modal dialog component for the Eulogia Ecosystem design system.
/// Ported from EUCloudHost's production customer modal with strict AGENTS.md compliance:
/// mounts smoothly at full opacity without replaying entrance animations on re-render.
class AppModal extends StatelessComponent {
  AppModal({
    required this.open,
    this.title,
    this.child,
    this.actions,
    this.size = AppModalSize.md,
    this.onClose,
  });

  final bool open;
  final String? title;
  final Object? child;
  final Object? actions;
  final AppModalSize size;
  final void Function(Object event)? onClose;

  @override
  View build() {
    if (!open) return const FlintFragment([]);

    final tokenLine = ThemeToken.color('line');
    final tokenPanel = ThemeToken.color('panel');
    final tokenPanelMuted = ThemeToken.color('panelMuted');
    final tokenInk = ThemeToken.color('ink');

    return Container(
      props: {
        'role': 'dialog',
        'aria-modal': 'true',
        if (title != null) 'aria-label': title,
      },
      dartStyle: DartStyle(
        position: Position.fixed,
        top: 0,
        right: 0,
        bottom: 0,
        left: 0,
        zIndex: 1000,
        display: Display.flex,
        alignItems: AlignItems.center,
        justifyContent: JustifyContent.center,
        padding: EdgeInsets.all(16),
        background: Color.rgba(2, 6, 23, 0.70),
        backdropFilter: StyleFilter.blur(10),
        overflowY: Overflow.auto,
      ),
      child: Container(
        dartStyle: DartStyle(
          width: SizeValue.full,
          maxWidth: _modalWidth(size),
          maxHeight: SizeValue('min(90vh, 880px)'),
          display: Display.flex,
          flexDirection: FlexDirection.column,
          radius: EulogiaRadius.md,
          overflow: Overflow.hidden,
          border: Border(color: tokenLine),
          background: tokenPanel,
          color: tokenInk,
          shadow: const Shadow(
            y: 24,
            blur: 56,
            spread: -26,
            color: Color.rgba(0, 0, 0, 0.48),
          ),
        ),
        children: [
          if (title != null || onClose != null)
            Row(
              dartStyle: DartStyle(
                minHeight: 58,
                flexShrink: 0,
                alignItems: AlignItems.center,
                justifyContent: JustifyContent.between,
                gap: 12,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                borderBottom: Border(color: tokenLine),
              ),
              children: [
                if (title != null)
                  Text.strong(
                    title!,
                    dartStyle: DartStyle(color: tokenInk, fontSize: 16),
                  ),
                if (onClose != null)
                  Button(
                    props: const {'aria-label': 'Close'},
                    variant: ButtonVariant.ghost,
                    onPressed: onClose,
                    dartStyle: DartStyle(
                      width: 32,
                      height: 32,
                      minHeight: 32,
                      padding: const EdgeInsets.all(0),
                      radius: EulogiaRadius.sm,
                      border: Border(color: tokenLine),
                      background: tokenPanelMuted,
                      color: tokenInk,
                      hover: DartStyle(
                        background: tokenPanel,
                        border: Border(color: tokenLine),
                        color: tokenInk,
                      ),
                    ),
                    child: Icon(Icons.x, size: 17),
                  ),
              ],
            ),
          Container(
            dartStyle: const DartStyle(
              padding: EdgeInsets.all(18),
              overflowY: Overflow.auto,
              flex: 1,
            ),
            child: child,
          ),
          if (actions != null)
            Container(
              dartStyle: DartStyle(
                padding: const EdgeInsets.all(18),
                borderTop: Border(color: tokenLine),
                flexShrink: 0,
              ),
              child: actions,
            ),
        ],
      ),
    );
  }

  static Object _modalWidth(AppModalSize size) {
    return switch (size) {
      AppModalSize.sm => 360,
      AppModalSize.lg => 720,
      AppModalSize.xl => 960,
      AppModalSize.md => 520,
    };
  }
}
