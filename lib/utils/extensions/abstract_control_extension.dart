import 'package:reactive_forms/reactive_forms.dart';

extension AbstractControlExtension on AbstractControl<dynamic> {
  bool checkNonEmpty() {
    if (value == null) {
      return false;
    } else if (value is String) {
      return (value as String).trim().isNotEmpty;
    }
    return false;
  }
}
