import 'package:elbdesk_core/elbdesk_core.dart';

abstract class DataComparable {}

mixin HasMetaData on Object {
  DataMeta get meta;
}
