import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipeRecord extends FirestoreRecord {
  RecipeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "ingredients" field.
  List<String>? _ingredients;
  List<String> get ingredients => _ingredients ?? const [];
  bool hasIngredients() => _ingredients != null;

  // "instructions" field.
  String? _instructions;
  String get instructions => _instructions ?? '';
  bool hasInstructions() => _instructions != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "caloris" field.
  int? _caloris;
  int get caloris => _caloris ?? 0;
  bool hasCaloris() => _caloris != null;

  // "grm" field.
  int? _grm;
  int get grm => _grm ?? 0;
  bool hasGrm() => _grm != null;

  // "resturantmenue" field.
  DocumentReference? _resturantmenue;
  DocumentReference? get resturantmenue => _resturantmenue;
  bool hasResturantmenue() => _resturantmenue != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _ingredients = getDataList(snapshotData['ingredients']);
    _instructions = snapshotData['instructions'] as String?;
    _image = snapshotData['image'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _price = castToType<double>(snapshotData['price']);
    _caloris = castToType<int>(snapshotData['caloris']);
    _grm = castToType<int>(snapshotData['grm']);
    _resturantmenue = snapshotData['resturantmenue'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recipe');

  static Stream<RecipeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecipeRecord.fromSnapshot(s));

  static Future<RecipeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecipeRecord.fromSnapshot(s));

  static RecipeRecord fromSnapshot(DocumentSnapshot snapshot) => RecipeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecipeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecipeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecipeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecipeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecipeRecordData({
  String? name,
  String? instructions,
  String? image,
  DateTime? createdTime,
  DocumentReference? user,
  double? price,
  int? caloris,
  int? grm,
  DocumentReference? resturantmenue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'instructions': instructions,
      'image': image,
      'createdTime': createdTime,
      'user': user,
      'price': price,
      'caloris': caloris,
      'grm': grm,
      'resturantmenue': resturantmenue,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecipeRecordDocumentEquality implements Equality<RecipeRecord> {
  const RecipeRecordDocumentEquality();

  @override
  bool equals(RecipeRecord? e1, RecipeRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.ingredients, e2?.ingredients) &&
        e1?.instructions == e2?.instructions &&
        e1?.image == e2?.image &&
        e1?.createdTime == e2?.createdTime &&
        e1?.user == e2?.user &&
        e1?.price == e2?.price &&
        e1?.caloris == e2?.caloris &&
        e1?.grm == e2?.grm &&
        e1?.resturantmenue == e2?.resturantmenue;
  }

  @override
  int hash(RecipeRecord? e) => const ListEquality().hash([
        e?.name,
        e?.ingredients,
        e?.instructions,
        e?.image,
        e?.createdTime,
        e?.user,
        e?.price,
        e?.caloris,
        e?.grm,
        e?.resturantmenue
      ]);

  @override
  bool isValidKey(Object? o) => o is RecipeRecord;
}
