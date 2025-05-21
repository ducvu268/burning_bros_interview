import 'package:intl/intl.dart';

class DateFormatUtil {
  static String duTimeLineFormat(DateTime dt) {
    var now = DateTime.now();
    var difference = now.difference(dt);

    /// time < 60 minutes
    if (difference.inMinutes < 60) {
      final dtFormat = DateFormat('HH:mm');
      String str = dtFormat.format(dt);
      return str;
    }

    /// time < 24 hours and < 30 days and < 365 days
    if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours < 365) {
      final dtFormat = DateFormat('MM-dd');
      String str = dtFormat.format(dt);
      return str;
    } else {
      final dtFormat = DateFormat('yyyy-MM-dd');
      String str = dtFormat.format(dt);
      return str;
    }
  }
}
