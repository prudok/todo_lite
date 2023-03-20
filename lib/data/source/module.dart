import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'files/files.dart';
import 'files/files_memory_impl.dart';


final filesProvider = Provider<Files>((ref) {
  return FilesMemoryImpl();
});