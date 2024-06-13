import 'package:cloud_firestore/cloud_firestore.dart';

class ChecklistItem{
  const ChecklistItem({
    required this.title,
    required this.asignees,
    required this.asigneesCompleted,
    required this.dueDate,
    required this.createdAt,
  });

  final String title;
  final List<String> asignees;
  final List<bool> asigneesCompleted;
  final DateTime? dueDate;
  final DateTime? createdAt;

  factory ChecklistItem.fromMap(Map<dynamic, dynamic> value) {
    return ChecklistItem(
      title: value['title'] as String,
      asignees: (value['asignees'] as List<dynamic>).cast<String>(),
      asigneesCompleted: (value['asigneesCompleted'] as List<dynamic>).cast<bool>(),
      dueDate: (value['dueDate'] as Timestamp?)?.toDate(),
      createdAt: (value['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'asignees': asignees,
      'asigneesCompleted': asigneesCompleted,
      'dueDate': dueDate != null ? Timestamp.fromDate(dueDate!) : null,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
    };
  }
}
