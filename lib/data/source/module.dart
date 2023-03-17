import 'package:flutter_riverpod/flutter_riverpod.dart';

import './files_impl.dart';
import 'files.dart';

final filesProvider = Provider<Files>((ref) {
  return FilesImpl();
});