# eulogia_ui

Unified Design System and UI Component library for the **Eulogia Ecosystem**.

Used by:
- **Eulogia OS** (`eulogia_system/eulogia`)
- **Stokash** (`stokash/backend` & `stokash/frontend`)
- **SchoolHQ** (`schoolhq/owner`)
- **EUCloudHost** (`eucloudhost`)

---

## 📦 Installation

### Option 1: Monorepo Local Path (Development)

Add to your app's `pubspec.yaml`:

```yaml
dependencies:
  flint_dart: ^1.5.2
  eulogia_ui:
    path: ../../eulogia_ui  # Adjust relative path to d:\eulogia-tech\eulogia_ui
```

### Option 2: GitHub Dependency (Production / Multi-Repo)

Once pushed to GitHub (`github.com/eulogia-tech/eulogia_ui`), reference directly:

```yaml
dependencies:
  flint_dart: ^1.5.2
  eulogia_ui:
    git:
      url: https://github.com/eulogia-tech/eulogia_ui.git
      ref: main
```

---

## 🚀 Quick Usage

```dart
import 'package:flint_dart/ui.dart';
import 'package:eulogia_ui/eulogia_ui.dart';

// 1. Primary Button
AppButton(
  text: 'Launch Instance',
  variant: AppButtonVariant.primary,
  size: AppButtonSize.md,
  onPressed: (e) => print('Clicked!'),
)

// 2. Status Badge with Dot
AppBadge(
  label: 'Active',
  variant: AppBadgeVariant.success,
  showDot: true,
)

// 3. Luxury Glass Card
AppCard(
  title: 'Active Servers',
  subtitle: 'EU-Central Cluster Node 04',
  titleIcon: Icons.server,
  children: [
    Text.p('Running 48 microservices with 99.98% uptime.'),
  ],
)

// 4. Metric Tile
AppMetricTile(
  label: 'Monthly Recurring Revenue',
  value: '₦4,250,000',
  sublabel: '+18.4% from last billing cycle',
  icon: Icons.trendingUp,
  accent: EulogiaColors.brandPrimary,
)

// 5. System Health Status Indicator
AppStatusIndicator(
  status: AppStatusType.operational,
)
```

---

## 🎨 Theme Tokens

```dart
import 'package:eulogia_ui/eulogia_ui.dart';

// Access shared colors:
final brand = EulogiaColors.brandPrimary; // #10b981
final surface = EulogiaColors.surfaceGlass;
final border = EulogiaColors.borderDefault;
```

---

## 🛠️ Testing & Analysis

```bash
cd eulogia_ui
dart analyze
```
