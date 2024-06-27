// checklist_preview.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/checklists/data/checklist_repository.dart';
import 'package:travel_link/src/features/checklists/domain/checklist_item.dart';
import 'package:travel_link/src/features/checklists/presentation/checklist_controller.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class ChecklistPreview extends ConsumerWidget {
  const ChecklistPreview({
    required this.tripId,
    required this.maxItems,
    super.key,
  });

  final String tripId;
  final int maxItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checklistProvider = ref.watch(fetchTripChecklistProvider(tripId: tripId, uid: ref.read(firebaseAuthProvider).currentUser?.uid));

    return checklistProvider.when(
      data: (checklist) {
        final uncheckedItems = checklist.where((item) => item.asigneesCompleted.any((completed) => !completed)).toList();
        return ListView.builder(
          itemCount: uncheckedItems.length > maxItems ? maxItems : uncheckedItems.length,
          itemBuilder: (context, index) {
            final item = uncheckedItems[index];
            return ListTile(
              title: Text(
                item.title,
                style: TextStyle(
                  decoration: item.asigneesCompleted.any((completed) => completed)
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              subtitle: item.dueDate != null
                  ? Text('Due: ${item.dueDate}')
                  : null,
              /*
              trailing: Checkbox(
                value: item.asigneesCompleted.any((completed) => completed),
                onChanged: (value) {
                  ref.read(checklistControllerProvider.notifier).toggleChecklistItemCompletion(item, tripId);
                },
              ),
              */ //toggleChecklistItemCompletion ist noch nicht implementiert, aber noch unklar ob das erledigt werden soll oder nicht, da ich noch überlege ob es sinn macht, dass man die checklist bearbeiten kann ohne auf den checklist screen zu kommen.
            );
          },
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error loading checklist')),
    );
  }
}
