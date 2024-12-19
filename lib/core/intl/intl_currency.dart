import 'package:intl/intl.dart';

extension IntlCurrency on num {
  String get inMYR => NumberFormat.currency(locale: "ms_MY", symbol: "RM").format(this);
}
