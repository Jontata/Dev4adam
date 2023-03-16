import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../flutter_flow/flutter_flow_util.dart';

import 'schema/brugere_record.dart';
import 'schema/serializers.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart';
export 'schema/index.dart';
export 'schema/serializers.dart';

export 'schema/brugere_record.dart';

import '../app_state.dart';

import 'package:hive/hive.dart';

class HiveBox {
  static Box<dynamic> getDataBox() => Hive.box<dynamic>('dataBox');
}

/// Functions to query BrugereRecords (as a Stream and as a Future).
Future<int> queryBrugereRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      BrugereRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<BrugereRecord>> queryBrugereRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      BrugereRecord.collection,
      BrugereRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<BrugereRecord>> queryBrugereRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      BrugereRecord.collection,
      BrugereRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<BrugereRecord>> queryBrugereRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) =>
    queryCollectionPage(
      BrugereRecord.collection,
      BrugereRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  return query.count().get().catchError((err) {
    print('Error querying $collection: $err');
  }).then((value) => value.count);
}

Stream<List<T>> queryCollection<T>(Query collection, Serializer<T> serializer,
    {Query Function(Query)? queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final cacheKey = 'collection:${collection.toString()}';
  final cachedData = HiveBox.getDataBox().get(cacheKey);

  if (cachedData != null) {
    return Stream.value(cachedData
        .map((item) => serializers.deserializeWith(serializer, item))
        .toList()
        .cast<T>());
  } else {
    final builder = queryBuilder ?? (q) => q;
    var query = builder(collection);
    if (limit > 0 || singleRecord) {
      query = query.limit(singleRecord ? 1 : limit);
    }
    return query.snapshots().handleError((err) {
      print('Error querying $collection: $err');
    }).map((s) {
      final data = s.docs
          .map(
            (d) => safeGet(
              () => serializers.deserializeWith(serializer, serializedData(d)),
              (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
            ),
          )
          .where((d) => d != null)
          .map((d) => d!)
          .toList();
      HiveBox.getDataBox().put(
          cacheKey,
          data
              .map((item) => serializers.serializeWith(serializer, item))
              .toList());
      return data;
    });
  }
}

Future<List<T>> queryCollectionOnce<T>(
    Query collection, Serializer<T> serializer,
    {Query Function(Query)? queryBuilder,
    int limit = -1,
    bool singleRecord = false}) async {
  final cacheKey = 'collection:${collection.toString()}';
  final cachedData = HiveBox.getDataBox().get(cacheKey);

  if (cachedData != null) {
    return cachedData
        .map((item) => serializers.deserializeWith(serializer, item))
        .toList()
        .cast<T>();
  } else {
    final builder = queryBuilder ?? (q) => q;
    var query = builder(collection);
    if (limit > 0 || singleRecord) {
      query = query.limit(singleRecord ? 1 : limit);
    }
    return query.get().then((s) {
      final data = s.docs
          .map(
            (d) => safeGet(
              () => serializers.deserializeWith(serializer, serializedData(d)),
              (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
            ),
          )
          .where((d) => d != null)
          .map((d) => d!)
          .toList();
      HiveBox.getDataBox().put(
          cacheKey,
          data
              .map((item) => serializers.serializeWith(serializer, item))
              .toList());
      return data;
    });
  }
}

extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  Serializer<T> serializer, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  final getDocs = (QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

Future<List<BrugereRecord>> queryBrugereRecordOnceCached({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      BrugereRecord.collection,
      BrugereRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<T?> getDocumentCached<T>(
    DocumentReference<Object?> document, Serializer<T> serializer) async {
  final cacheKey = 'document:${document.path}';
  final cachedData = HiveBox.getDataBox().get(cacheKey);

  if (cachedData != null) {
    return serializers.deserializeWith(serializer, cachedData) as T?;
  } else {
    final docSnapshot = await document.get();
    if (!docSnapshot.exists) {
      return null;
    }
    final data =
        serializers.deserializeWith(serializer, serializedData(docSnapshot));
    HiveBox.getDataBox()
        .put(cacheKey, serializers.serializeWith(serializer, data));
    return data;
  }
}

Future<void> updateDocumentCached<T>(DocumentReference<Object?> document,
    Serializer<T> serializer, Map<String, dynamic> updateData) async {
  final cacheKey = 'document:${document.path}';
  final cachedData = HiveBox.getDataBox().get(cacheKey);

  if (cachedData != null) {
    final oldData = serializers.deserializeWith(serializer, cachedData)
        as Map<String, dynamic>;
    final newData = {...oldData, ...updateData};
    HiveBox.getDataBox()
        .put(cacheKey, serializers.serializeWith(serializer, newData));
  }

  await document.update(updateData);
}
