import 'package:flint_dart/ui.dart';
import '../theme/tokens.dart';

enum AppCardVariant {
  glass,
  solid,
  subtle,
}

/// Unified Card component for the Eulogia Ecosystem design system.
/// Dynamically aware of light and dark themes using ecosystem design tokens.
class AppCard extends StatelessComponent {
  AppCard({
    this.title,
    this.subtitle,
    this.titleIcon,
    this.headerAction,
    this.header,
    this.child,
    this.children,
    this.variant = AppCardVariant.glass,
    this.padding = const EdgeInsets.all(20),
    this.headerPadding = const EdgeInsets.only(bottom: 16),
    this.dartStyle,
  });

  final String? title;
  final String? subtitle;
  final IconData? titleIcon;
  final FlintNode? headerAction;
  final FlintNode? header;
  final FlintNode? child;
  final List<FlintNode>? children;
  final AppCardVariant variant;
  final EdgeInsets padding;
  final EdgeInsets headerPadding;
  final DartStyle? dartStyle;

  @override
  View build() {
    final tokenPanel = ThemeToken.color('panel');
    final tokenPanelMuted = ThemeToken.color('panelMuted');
    final tokenLine = ThemeToken.color('line');
    final tokenInk = ThemeToken.color('ink');
    final tokenMuted = ThemeToken.color('muted');

    dynamic bg;
    Border border;

    switch (variant) {
      case AppCardVariant.glass:
      case AppCardVariant.solid:
        bg = tokenPanel;
        border = Border.all(color: tokenLine);
        break;
      case AppCardVariant.subtle:
        bg = tokenPanelMuted;
        border = Border.all(color: tokenLine);
        break;
    }

    final List<FlintNode> cardContent = [];

    // Header
    if (header != null) {
      cardContent.add(header!);
    } else if (title != null) {
      final List<FlintNode> titleRowChildren = [];
      if (titleIcon != null) {
        titleRowChildren.add(
          Icon(
            titleIcon!,
            size: 16,
            color: EulogiaColors.brandPrimary,
            dartStyle: const DartStyle(margin: EdgeInsets.only(right: 8)),
          ),
        );
      }
      titleRowChildren.add(
        Column(
          children: [
            Text.h3(
              title!,
              dartStyle: DartStyle(
                fontSize: 15,
                fontWeight: 700,
                color: tokenInk,
                margin: EdgeInsets.zero,
              ),
            ),
            if (subtitle != null)
              Text.p(
                subtitle!,
                dartStyle: DartStyle(
                  fontSize: 12,
                  color: tokenMuted,
                  margin: const EdgeInsets.only(top: 2),
                ),
              ),
          ],
        ),
      );

      cardContent.add(
        Row(
          dartStyle: DartStyle(
            display: Display.flex,
            justifyContent: JustifyContent.between,
            alignItems: AlignItems.center,
            padding: headerPadding,
          ),
          children: [
            Row(
              dartStyle: const DartStyle(
                display: Display.flex,
                alignItems: AlignItems.center,
              ),
              children: titleRowChildren,
            ),
            if (headerAction != null) headerAction!,
          ],
        ),
      );
    }

    if (child != null) {
      cardContent.add(child!);
    } else if (children != null) {
      cardContent.addAll(children!);
    }

    return Container(
      dartStyle: DartStyle(
        background: bg,
        border: border,
        radius: EulogiaRadius.md,
        padding: padding,
        display: Display.flex,
        flexDirection: FlexDirection.column,
        color: tokenInk,
        shadow: const Shadow(
          y: 4,
          blur: 16,
          spread: -4,
          color: Color.rgba(15, 23, 42, 0.05),
        ),
      ).merge(dartStyle),
      children: cardContent,
    );
  }
}
