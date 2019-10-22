import 'package:flutter/widgets.dart';
import 'package:provider_start/core/enums/view_state.dart';

/// Class for viewmodels to extend from. Keeps track
/// of [ViewState] and exposes a function to change the
/// state of the view.
class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;

    notifyListeners();
  }
}
