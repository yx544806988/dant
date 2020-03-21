import 'package:example/view/base/model.dart';

class Presenter {
  final Model model;

  Presenter({this.model});

  notifyWidget() {
    if (model.state.mounted) {
      model.state.setState(() {});
    }
  }
}
