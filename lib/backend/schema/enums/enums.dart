import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

enum Status {
  completed,
  pending,
  delivered,
}

enum Orderstatus {
  OrderPlaced,
  completed,
  delivered,
}

enum VerificationStatus {
  Reject,
  pending,
  Approved,
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Status):
      return Status.values.deserialize(value) as T?;
    case (Orderstatus):
      return Orderstatus.values.deserialize(value) as T?;
    case (VerificationStatus):
      return VerificationStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
