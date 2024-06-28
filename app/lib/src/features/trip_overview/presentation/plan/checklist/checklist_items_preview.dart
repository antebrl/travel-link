// checklist_preview.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
    final currentUser = ref.watch(firebaseAuthProvider).currentUser;

    if (currentUser == null) {
      return const Center(
        child: Text('You need to log in to view the checklist'),
      );
    }

//Ensure that only checklist items are displayed that are unchecked in personal checklist
    return checklistProvider.when(
      data: (checklist) {

        if(currentUser != null) {
          checklist = checklist.where((item) {
          final userIndex = item.asignees.indexOf(currentUser.uid);
          return userIndex != -1 && !item.asigneesCompleted[userIndex];
        }).toList();
        }


        return ListView.builder(
          itemCount: checklist.length > maxItems ? maxItems : checklist.length,
          itemBuilder: (context, index) {
            final item = checklist[index];
            final completedCount = item.asigneesCompleted.where((completed) => completed).length;
            final totalCount = item.asigneesCompleted.length;
            return ListTile(
              title: Text(item.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.dueDate != null) Text('Due: ${DateFormat('dd/MM/yyyy').format(item.dueDate!)}'),
                  Text('Completed: $completedCount/$totalCount'),
                ],
              ),
            );
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => const Center(child: Text('Error loading checklist')),
    );
  }
}
