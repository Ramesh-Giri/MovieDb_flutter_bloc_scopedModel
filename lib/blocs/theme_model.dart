import 'package:scoped_model/scoped_model.dart';

class ThemeModel extends Model {
  bool _theme = true;

  bool get theme => _theme;


  changeTheme() {
    _theme = !_theme;
    notifyListeners();
  }
}
