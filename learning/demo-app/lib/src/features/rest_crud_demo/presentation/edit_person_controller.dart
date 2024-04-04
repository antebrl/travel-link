import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/logger.dart';
import '../data/people_repository.dart';
import '../domain/person.dart';

part 'edit_person_controller.g.dart';

// in some cases it might be good to store the current selected item in a
// separate provider
// final currentPersonProvider = StateProvider<Person?>((ref) {
//   return null;
// });

@riverpod
class EditPersonController extends _$EditPersonController {
  @override
  FutureOr<Person?> build() {
    ref.onDispose(
      () => logger.i('EditPersonController ----- dispose controller -----'),
    );
    state = const AsyncData(null);
    return state.value;
  }

  //for non string-based setters and hence input fields without own controllers
  //use setters like
  // void setCheckboxField(bool value) {
  //   state = AsyncData(state.value!.copyWith(isBossy: value));
  // }

  /// Show the form with the values given by [person].
  void editPerson(Person person) {
    state = AsyncData(person);
  }

  /// Show the form with empty fields, ready to create a new person.
  void newPerson() {
    state = const AsyncData(Person(id: -1, name: '', imageUrl: ''));
  }

  Future<void> delete() async {
    if (state.value == null || state.value!.id < 0) {
      return;
    }
    state = const AsyncLoading<Person?>();
    try {
      final repo = ref.read(peopleRepositoryProvider);
      await repo.deletePerson(state.value!.id);
      //this provider does not know this change, hence we need to force a
      //refresh by invalidating it
      ref.invalidate(fetchPeopleProvider);
      state = const AsyncData(null);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  Future<void> save({required String name, required String imageUrl}) async {
    if (name.isEmpty || state.value == null) {
      return;
    }
    // use copywith to keep id
    final editedPerson = state.value!.copyWith(name: name, imageUrl: imageUrl);
    // to keep changes of the form fields, even if we may have an error
    state = AsyncData(editedPerson);
    state = const AsyncLoading<Person?>();
    try {
      final repo = ref.read(peopleRepositoryProvider);
      if (editedPerson.id < 0) {
        await repo.savePerson(person: editedPerson);
      } else {
        await repo.updatePerson(person: editedPerson);
      }
      ref.invalidate(fetchPeopleProvider);
      state = const AsyncData(null);
    } catch (error) {
      state = AsyncError<Person?>(error, StackTrace.current);
    }
  }
}
