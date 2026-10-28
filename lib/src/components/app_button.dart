import 'package:flint_dart/ui.dart';
import '../theme/tokens.dart';

enum AppButtonVariant {
  primary,
  secondary,
  ghost,
  pill,
  outline,
  danger,
}

enum AppButtonSize {
  sm,
  md,
  lg,
}

/// Unified Button component for the Eulogia Ecosystem design system.
/// Updating this component instantly alters buttons across Eulogia, Stokash, SchoolHQ, and EUCloudHost.
class AppButton extends StatelessComponent {
  AppButton({
    this.text,
    this.child,
    this.children,
    this.leadingIcon,
    this.trailingIcon,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.md,
    this.loading = false,
    this.disabled = false,
    this.block = false,
    this.dartStyle,
    this.onPressed,
  });

  final String? text;
  final FlintNode? child;
  final List<FlintNode>? children;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool loading;
  final bool disabled;
  final bool block;
  final DartStyle? dartStyle;
  final void Function(Object event)? onPressed;

  @override
  View build() {
    final effectiveStyle = _resolveStyle().merge(dartStyle);

    final contentNodes = <FlintNode>[];

    if (leadingIcon != null && !loading) {
      contentNodes.add(
        Icon(
          leadingIcon!,
          size: _iconSize(),
          dartStyle: const DartStyle(margin: EdgeInsets.only(right: 6)),
        ),
      );
    }

    if (loading) {
      contentNodes.add(
        Text.span(
          '⏳',
          dartStyle: const DartStyle(margin: EdgeInsets.only(right: 6)),
        ),
      );
    }

    if (text != null) {
      contentNodes.add(
        Text.span(
          text!,
          dartStyle: const DartStyle(fontWeight: 700),
        ),
      );
    } else if (child != null) {
      contentNodes.add(child!);
    } else if (children != null) {
      contentNodes.addAll(children!);
    }

    if (trailingIcon != null && !loading) {
      contentNodes.add(
        Icon(
          trailingIcon!,
          size: _iconSize(),
          dartStyle: const DartStyle(margin: EdgeInsets.only(left: 6)),
        ),
      );
    }

    return Button(
      onPressed: (disabled || loading) ? null : onPressed,
      disabled: disabled,
      loading: loading,
      dartStyle: effectiveStyle,
      children: contentNodes,
    );
  }

  double _iconSize() {
    switch (size) {
      case AppButtonSize.sm:
        return 13.0;
      case AppButtonSize.md:
        return 15.0;
      case AppButtonSize.lg:
        return 18.0;
    }
  }

  DartStyle _resolveStyle() {
    EdgeInsets padding;
    double fontSize;
    double radius;

    switch (size) {
      case AppButtonSize.sm:
        padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5);
        fontSize = 12.0;
        radius = EulogiaRadius.sm;
        break;
      case AppButtonSize.md:
        padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 9);
        fontSize = 13.5;
        radius = EulogiaRadius.md;
        break;
      case AppButtonSize.lg:
        padding = const EdgeInsets.symmetric(horizontal: 22, vertical: 12);
        fontSize = 15.0;
        radius = EulogiaRadius.md;
        break;
    }

    Color bg;
    Color fg;
    Border? border;

    switch (variant) {
      case AppButtonVariant.primary:
        bg = EulogiaColors.brandPrimary;
        fg = const Color('#052e16');
        break;
      case AppButtonVariant.secondary:
        bg = EulogiaColors.surfaceSolid;
        fg = EulogiaColors.textPrimary;
        border = Border.all(color: EulogiaColors.borderDefault);
        break;
      case AppButtonVariant.ghost:
        bg = const Color.rgba(0, 0, 0, 0);
        fg = EulogiaColors.textPrimary;
        break;
      case AppButtonVariant.pill:
        bg = EulogiaColors.brandPrimary;
        fg = const Color('#052e16');
        radius = EulogiaRadius.full;
        break;
      case AppButtonVariant.outline:
        bg = const Color.rgba(0, 0, 0, 0);
        fg = EulogiaColors.brandPrimary;
        border = Border.all(color: EulogiaColors.brandPrimary);
        break;
      case AppButtonVariant.danger:
        bg = EulogiaColors.danger;
        fg = const Color('#ffffff');
        break;
    }

    return DartStyle(
      display: block ? Display.flex : Display.inlineFlex,
      width: block ? SizeValue.full : null,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      padding: padding,
      fontSize: fontSize,
      fontWeight: 700,
      radius: radius,
      background: bg,
      color: fg,
      border: border,
      cursor: (disabled || loading) ? Cursor.notAllowed : Cursor.pointer,
      opacity: (disabled || loading) ? 0.6 : 1.0,
    );
  }
}
