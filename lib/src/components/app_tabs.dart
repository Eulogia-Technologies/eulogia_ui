import 'package:flint_dart/ui.dart';

import '../theme/tokens.dart';

/// Representation of a single tab item in [AppTabs].
class AppTabItem {
  const AppTabItem({
    required this.id,
    required this.label,
    this.icon,
    this.count,
  });

  final String id;
  final String label;
  final IconData? icon;
  final int? count;
}

/// Reusable pill tab-switcher matching the EUCloudHost design language.
class AppTabs extends StatelessComponent {
  AppTabs({
    required this.tabs,
    required this.activeTab,
    required this.onTabChanged,
    this.dartStyle,
  });

  final List<AppTabItem> tabs;
  final String activeTab;
  final void Function(String tabId) onTabChanged;
  final DartStyle? dartStyle;

  @override
  View build() {
    return Container(
      dartStyle: DartStyle(
        display: Display.flex,
        gap: 6,
        padding: const EdgeInsets.all(4),
        radius: EulogiaRadius.md,
        background: ThemeToken.color('panelMuted'),
        border: Border.all(color: ThemeToken.color('line')),
      ).merge(dartStyle),
      children: [
        for (final tab in tabs) _buildTab(tab),
      ],
    );
  }

  View _buildTab(AppTabItem tab) {
    final isSelected = activeTab == tab.id;
    final title = tab.count != null ? '${tab.label} (${tab.count})' : tab.label;

    return Button(
      variant: ButtonVariant.ghost,
      onPressed: (_) => onTabChanged(tab.id),
      dartStyle: DartStyle(
        display: Display.flex,
        alignItems: AlignItems.center,
        gap: 8,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        radius: EulogiaRadius.sm,
        fontSize: 13,
        fontWeight: isSelected ? 600 : 500,
        background: isSelected ? ThemeToken.color('panel') : Colors.transparent,
        color: isSelected ? ThemeToken.color('ink') : ThemeToken.color('muted'),
        border: isSelected ? Border.all(color: ThemeToken.color('line')) : null,
        cursor: Cursor.pointer,
        shadow: isSelected
            ? const Shadow(
                y: 1,
                blur: 2,
                spread: 0,
                color: Color.rgba(0, 0, 0, 0.05),
              )
            : null,
      ),
      children: [
        if (tab.icon != null) Icon(tab.icon!, size: 16),
        Text.span(title),
      ],
    );
  }
}
