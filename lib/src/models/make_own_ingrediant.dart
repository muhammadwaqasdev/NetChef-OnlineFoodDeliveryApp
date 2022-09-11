import 'dart:ui';

class MakeOwnIngrediant{
  final String name;
  final String image;
  final List<Offset> positions;

  MakeOwnIngrediant(this.image, this.name, this.positions);

  bool compare(MakeOwnIngrediant ingrediant) => ingrediant.image == image;
  bool compareName(String ingrediant) => ingrediant == name;
}