import 'package:bender/src/action/action.dart';
import 'package:bender/src/repository/merge_master.dart';

/// An iterable of all available actions.
final Iterable<Action> allActions = [
  mergeMaster,
];