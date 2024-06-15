import 'package:cloud_firestore/cloud_firestore.dart';

class ChecklistItem{
  ChecklistItem({
    required this.title,
    required this.asignees,
    required this.asigneesCompleted,
    required this.dueDate,
    required this.createdAt,
    required this.id, 
    this.onlyOneCompletion = false,
  });

  String title;
  List<String> asignees;
  List<bool> asigneesCompleted;
  DateTime? dueDate;
  final DateTime? createdAt;
  final bool onlyOneCompletion;
  final String id;

  factory ChecklistItem.fromMap(Map<dynamic, dynamic> value, String id) {
    return ChecklistItem(
      title: value['title'] as String,
      asignees: (value['asignees'] as List<dynamic>).cast<String>(),
      asigneesCompleted: (value['asigneesCompleted'] as List<dynamic>).cast<bool>(),
      dueDate: (value['dueDate'] as Timestamp?)?.toDate(),
      createdAt: (value['createdAt'] as Timestamp?)?.toDate(),
      onlyOneCompletion: value['onlyOneCompletion'] as bool,
      id: id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'asignees': asignees,
      'asigneesCompleted': asigneesCompleted,
      'dueDate': dueDate != null ? Timestamp.fromDate(dueDate!) : null,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'onlyOneCompletion': onlyOneCompletion,
    };
  }
}
