import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:online_exam/features/main_layout/results/data/dataSource/result_local_data_source.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_exam_entity.dart';

@Injectable(as: ResultLocalDataSource)
class ResultLocalDataSourceImpl implements ResultLocalDataSource {
  @override
  List<SolvedExamEntity> getSolvedExams() {
    final exameBox = Hive.box<SolvedExamEntity>(AppConstants.examBoxName);
    return exameBox.values.toList();
  }
}
