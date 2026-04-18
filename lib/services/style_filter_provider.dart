import 'package:flutter/material.dart';
import '../models/style_filter_model.dart';

class StyleFilterProvider extends ChangeNotifier {
  StyleFilterModel? _selectedFilter;
  final List<StyleFilterModel> _filters = StyleFilterModel.defaults;
  bool _isProcessing = false;

  StyleFilterModel? get selectedFilter => _selectedFilter;
  List<StyleFilterModel> get filters => _filters;
  bool get isProcessing => _isProcessing;

  void selectFilter(StyleFilterModel filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  void clearFilter() {
    _selectedFilter = null;
    notifyListeners();
  }

  Future<void> applyFilter() async {
    if (_selectedFilter == null) return;
    _isProcessing = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _isProcessing = false;
    notifyListeners();
  }
}
