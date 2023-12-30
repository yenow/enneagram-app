import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

final DateFormat dateFormatter = DateFormat('yyyy-MM-dd hh:mm');

final String webUrl =  'http://168.126.221.239:58000';
