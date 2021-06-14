import 'dart:ui';

///Khởi tạo class Gradient và các thuộc tính
class Gradient {
  String _name;
  Color _to;
  Color _from;

  get gradient => [_from, _to];

  get to => _to;

  get from => _from;

  get name => _name;

  Gradient({String name, Color from, Color to})
      : _to = to,
        _from = from,
        _name = name;

  @override
  String toString() {
    return 'Gradient(name: $_name, to: $_from, from: $_to)';
  }
}

///Tạo list chứa các Gradient - clas này để set tên, giá trị màu đổ dóc từ màu A đến màu B
class GradientValues {
  List<Gradient> _gradients = [
    Gradient(
      name: "A Lost Memory",
      from: Color(0xFFdd5e89),
      to: Color(0xFFf7bb97),
    ),
    Gradient(
      name: "Scooter",
      from: Color(0xFF5b86e5),
      to: Color(0xFF36d1dc),
    ),
  ];
  get gradients => _gradients;
}

