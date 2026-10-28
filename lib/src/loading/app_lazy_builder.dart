import 'package:flint_dart/ui.dart';
import 'app_skeleton.dart';

/// Convenient Lazy-Loading Wrapper.
/// When [loading] is true, renders the specified [skeleton] placeholder.
/// When false, reveals the rendered [child].
class AppLazyLoader extends StatelessComponent {
  AppLazyLoader({
    required this.loading,
    required this.child,
    this.skeleton,
  });

  final bool loading;
  final FlintNode child;
  final FlintNode? skeleton;

  @override
  View build() {
    if (loading) {
      return skeleton ?? AppSkeleton.card();
    }
    return child;
  }
}

