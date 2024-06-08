import 'package:intl/intl.dart';

class CustomFormatter {
  static String formatDateChat(DateTime timestamp) {
    //TODO (Ante): make the language setting dynamic
    if(timestamp.day  == DateTime.now().day)
      return DateFormat('\'heute um\' HH:mm', 'de_DE').format(timestamp); 
    else if(timestamp.day == DateTime.now().day - 1) 
      return DateFormat('\'gestern um\' HH:mm', 'de_DE').format(timestamp); 
    else
      return DateFormat('dd.MM.yyyy \'um\' HH:mm', 'de_DE').format(timestamp); 
  }

  static String formatDateRange({required DateTime startDate, required DateTime endDate}) {
    return '${DateFormat('dd.MM.yyyy').format(startDate)} - ${DateFormat('dd.MM.yyyy').format(endDate)}';
  }
}
