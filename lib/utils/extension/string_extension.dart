import 'package:intl/intl.dart';

extension StringExtension on String? {
  int monthToInt() {
    switch (this) {
      case 'Januari':
        return 1;
      case 'Februari':
        return 2;
      case 'Maret':
        return 3;
      case 'April':
        return 4;
      case 'Mei':
        return 5;
      case 'Juni':
        return 6;
      case 'Juli':
        return 7;
      case 'Agustus':
        return 8;
      case 'September':
        return 9;
      case 'Oktober':
        return 10;
      case 'November':
        return 11;
      case 'Desember':
        return 12;
      default:
        return 0;
    }
  }

  String intToMonth() {
    switch (this) {
      case '01':
        return "Januari";
      case '02':
        return "Februari";
      case '03':
        return "Maret";
      case '04':
        return "April";
      case '05':
        return "Mei";
      case '06':
        return "Juni";
      case '07':
        return "Juli";
      case '08':
        return "Agustus";
      case '09':
        return "September";
      case '10':
        return "Oktober";
      case '11':
        return "November";
      case '12':
        return "Desember";
      default:
        return "";
    }
  }

  String toPrice() {
    if (this == null) return "";

    final price =
        NumberFormat('#,###', 'id_ID').format(int.tryParse(this!) ?? 0);

    return "Rp$price";
  }
}
