import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/checklists/data/checklist_repository.dart';
import 'package:travel_link/src/features/checklists/domain/checklist_item.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

part 'checklist_controller.g.dart';

@riverpod
class ChecklistController extends _$ChecklistController {
  @override
  FutureOr<void> build() async {
    //
  }

  Future<bool> createPersonalChecklistItem({
    required String title,
    required String tripId,
    DateTime? dueDate,
  }) async {
    final currentUser = ref.read(firebaseAuthProvider).currentUser;

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(checklistRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.createChecklistItem(
        asignees: [currentUser!.uid],
        asigneesCompleted: [false],
        title: title,
        tripId: tripId,
        onlyOneCompletion: true,
        createdAt: DateTime.now(),
        dueDate: dueDate,
      ),
    );

    if(state.hasError) logger.e(state.error);
    return state.hasError == false;
  }


  //not used atm
  Future<bool> createChecklistItem({
    required String title,
    required String tripId,
    required List<String> asignees,
    DateTime? dueDate,
    bool onlyOneCompletion = false,
  }) async {

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(checklistRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.createChecklistItem(
        asignees: asignees,
        asigneesCompleted: List.filled(asignees.length, false),
        title: title,
        tripId: tripId,
        onlyOneCompletion: onlyOneCompletion,
        createdAt: DateTime.now(),
        dueDate: dueDate,
      ),
    );

    if(state.hasError) logger.e(state.error);
    return state.hasError == false;
  }


  Future<bool> updateChecklistItem({
    required ChecklistItem data,
    required String tripId,
  }) async {

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(checklistRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.updateChecklistData(
        tripId: tripId,
        data: data,
      ),
    );

    if (state.hasError) logger.e(state.error);
    return state.hasError == false;
  }


  // Future<bool> removeChecklistItem({
  //   required String id,
  //   required String tripId,
  // }) async {

  //   //set state to loading
  //   state = const AsyncLoading();

  //   final repository = ref.read(checklistRepositoryProvider);

  //   state = await AsyncValue.guard(
  //     () => repository.updateChecklistData(
  //       tripId: tripId,
  //       data: data,
  //     ),
  //   );

  //   if (state.hasError) logger.e(state.error);
  //   return state.hasError == false;
  // }

}
