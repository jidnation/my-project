import 'package:my_project/Models/database_controller.dart';

SelfDatabase _selfDatabase = SelfDatabase();

class Datas {
  var selfData;

  getter() async {
    await _selfDatabase.selfReportTableGen();
    selfData = await _selfDatabase.selfReport();
  }
}
