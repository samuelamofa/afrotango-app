import 'package:collection/collection.dart';

enum Status {
  completed,
  pending,
  delivered,
}

enum Orderstatus {
  OrderPlaced,
  completed,
  delivery,
}

enum Verystatus {
  Reject,
  pending,
  Approve,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Status):
      return Status.values.deserialize(value) as T?;
    case (Orderstatus):
      return Orderstatus.values.deserialize(value) as T?;
    case (Verystatus):
      return Verystatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
