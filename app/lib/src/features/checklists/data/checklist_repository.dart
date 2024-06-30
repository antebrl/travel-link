import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/checklists/domain/checklist_item.dart';

part 'checklist_repository.g.dart';

class ChecklistRepository {
  const ChecklistRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String checklistPath(String tripId) => 'trips/$tripId/checklist';

  // create
    Future<void> createChecklistItem(
      { required String tripId,
        required String title,
      required List<String> asignees,
      required List<bool> asigneesCompleted,
      required bool onlyOneCompletion,
      required bool isPublic,
      DateTime? dueDate,
      DateTime? createdAt}) =>
      _firestore.collection(checklistPath(tripId)).add({
        'title': title,
      'asignees': asignees,
      'asigneesCompleted': asigneesCompleted,
      'dueDate': dueDate != null ? Timestamp.fromDate(dueDate) : null,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt) : null,
      'onlyOneCompletion': onlyOneCompletion,
      'isPublic': isPublic,
      });

    Future<void> updateChecklistData({
    required String tripId,
    required ChecklistItem data,
  }) async {
    return _firestore.collection(checklistPath(tripId)).doc(data.id).set(data.toMap());
  }

  // delete checklist item
  Future<void> deleteChecklistItem({
    required String tripId,
    required String checklistItemId,
  }) async {
    return _firestore.collection(checklistPath(tripId)).doc(checklistItemId).delete();
  }

  // read

  Future<List<ChecklistItem>> fetchTripChecklist(
      { required String tripId, required bool onlyPublic, String? uid}) async {

    var checklist = queryTripChecklist(
      tripId: tripId,
    );
    if(onlyPublic) {
       checklist = checklist.where('isPublic', isEqualTo: true);
    } else if(uid != null) {
      checklist = checklist.where('asignees', arrayContains: uid);
    }

    final tasks = await checklist.get();
    return tasks.docs.map((doc) => doc.data()).toList();
  }

  //QUERIES

  Query<ChecklistItem> queryTripChecklist({
    required String tripId,
  }) =>
     _firestore
        .collection(checklistPath(tripId))
        .withConverter(
          fromFirestore: (snapshot, _) =>
              ChecklistItem.fromMap(snapshot.data()!, snapshot.id),
          toFirestore: (checklistItem, _) => checklistItem.toMap(),
        );
}

@Riverpod(keepAlive: true)
ChecklistRepository checklistRepository(ChecklistRepositoryRef ref) {
  return ChecklistRepository(FirebaseFirestore.instance);
}

@riverpod
Future<List<ChecklistItem>> fetchTripChecklist(
  FetchTripChecklistRef ref, {
  required String tripId,
  bool onlyPublic = false,
  String? uid,
}) {
  final repository = ref.watch(checklistRepositoryProvider);
  return repository.fetchTripChecklist(
    tripId: tripId,
    onlyPublic: onlyPublic,
    uid: uid,
  );
}
