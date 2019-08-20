import 'package:meta/meta.dart';

@immutable
class CountState{
  int _count;
  get count => _count;

  CountState(this._count);



}