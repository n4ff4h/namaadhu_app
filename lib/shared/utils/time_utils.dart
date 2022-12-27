import 'package:intl/intl.dart';

class TimeUtils {
  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }

  int getDayOfYear(DateTime dateTime) {
    return int.parse(DateFormat("D").format(dateTime));
  }
}
