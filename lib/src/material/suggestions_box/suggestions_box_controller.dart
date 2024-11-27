import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/src/material/suggestions_box/suggestions_box.dart';

/// Supply an instance of this class to the [TypeAhead.suggestionsBoxController]
/// property to manually control the suggestions box
class SuggestionsBoxController<T> {
  SuggestionsBox? suggestionsBox;
  FocusNode? effectiveFocusNode;

  // Create a StreamController
  final StreamController<List<T>?> _controller = StreamController<List<T>?>();

  // Expose the stream
  Stream<List<T>?> get stream => _controller.stream;

  /// Opens the suggestions box
  void open() => effectiveFocusNode?.requestFocus();

  bool isOpened() => suggestionsBox?.isOpened ?? false;

  /// Closes the suggestions box
  void close() => effectiveFocusNode?.unfocus();

  /// Opens the suggestions box if closed and vice-versa
  void toggle() {
    if (suggestionsBox?.isOpened ?? false) {
      close();
    } else {
      open();
    }
  }

  /// Recalculates the height of the suggestions box
  void resize() => suggestionsBox!.resize();

  // Method to add a value to the stream
  void updateSuggestions(List<T>? value) {
    _controller.add(value);
  }

  // Dispose the controller when done
  void dispose() {
    _controller.close();
  }
}
