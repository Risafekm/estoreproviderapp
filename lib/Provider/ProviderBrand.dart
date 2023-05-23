import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Model/brand.dart';

class ProviderBrand extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
}
