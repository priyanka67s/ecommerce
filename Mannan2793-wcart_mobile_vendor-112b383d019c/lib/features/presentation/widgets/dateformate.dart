import 'package:intl/intl.dart';

String? formatOrderDate(String? date) {
  if (date == null || date.isEmpty) return null;

  try {
    DateTime parsedDate = DateTime.parse(date); // Parse the date string
    String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
    // HH:mm:ss
    return formattedDate;
  } catch (e) {
    print('Error formatting date: $e');
    return date; // Return the original date string if there's an error
  }
}
