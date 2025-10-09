import 'package:tasks/core/constants/app_strings/i18n_keys.dart';

part 'parts/all_strings.dart';

class DefaultString {
  DefaultString._();
  static final DefaultString instance = DefaultString._();

  String _getString(String key, {required String fallback}) {
    return fallback;
  }
}