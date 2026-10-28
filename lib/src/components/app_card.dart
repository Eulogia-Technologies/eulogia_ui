import 'package:flint_dart/ui.dart';
import '../theme/tokens.dart';

enum AppCardVariant {
  glass,
  solid,
  subtle,
}

/// Unified Card component for the Eulogia Ecosystem design system.
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
    Color bg;
    Border border;

    switch (variant) {
      case AppCardVariant.glass:
        bg = EulogiaColors.surfaceGlass;
        border = Border.all(color: EulogiaColors.borderDefault);
        break;
      case AppCardVariant.solid:
        bg = EulogiaColors.surfaceSolid;
        border = Border.all(color: EulogiaColors.borderDefault);
        break;
      case AppCardVariant.subtle:
        bg = EulogiaColors.surfaceMuted;
        border = Border.all(color: EulogiaColors.borderSubtle);
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
              dartStyle: const DartStyle(
                fontSize: 15,
                fontWeight: 700,
                color: EulogiaColors.textPrimary,
                margin: EdgeInsets.zero,
              ),
            ),
            if (subtitle != null)
              Text.p(
                subtitle!,
                dartStyle: const DartStyle(
                  fontSize: 12,
                  color: EulogiaColors.textMuted,
                  margin: EdgeInsets.only(top: 2),
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
        radius: EulogiaRadius.lg,
        padding: padding,
        display: Display.flex,
        flexDirection: FlexDirection.column,
      ).merge(dartStyle),
      children: cardContent,
    );
  }
}
