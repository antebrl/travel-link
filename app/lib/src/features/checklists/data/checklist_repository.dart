import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/checklists/domain/checklist_item.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';

part 'checklist_repository.g.dart';

class ChecklistRepository {
  const ChecklistRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String checklistPath(String tripId) => 'trips/$tripId/checklist';

  // create [NOT USED ATM]
    Future<List<ChecklistItem>> createChecklistItem(
      { required String tripId,
        required String title,
      required List<String> asignees,
      required List<bool> asigneesCompleted,
      DateTime? dueDate,
      DateTime? createdAt}) async {
    final trips = await queryTripChecklist(
      tripId: tripId,
    ).get();
    return trips.docs.map((doc) => doc.data()).toList();
  }

  // read

  Future<List<ChecklistItem>> fetchTripChecklist(
      { required String tripId,}) async {
    final trips = await queryTripChecklist(
      tripId: tripId,
    ).get();
    return trips.docs.map((doc) => doc.data()).toList();
  }

  //QUERIES

  Query<ChecklistItem> queryTripChecklist({
    required String tripId,
  }) =>
     _firestore
        .collection(checklistPath(tripId))
        .withConverter(
          fromFirestore: (snapshot, _) =>
              ChecklistItem.fromMap(snapshot.data()!),
          toFirestore: (checklistItem, _) => checklistItem.toMap(),
        );
}

@Riverpod(keepAlive: true)
ChecklistRepository checklistRepository(ChecklistRepositoryRef ref) {
  return ChecklistRepository(FirebaseFirestore.instance);
}

@riverpod
Future<List<ChecklistItem>> fetchTripChecklist(
  ChecklistRepositoryRef ref, {
  required String tripId,
}) {
  final repository = ref.watch(checklistRepositoryProvider);
  return repository.fetchTripChecklist(
    tripId: tripId,
  );
}
