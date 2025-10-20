import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:online_exam/features/Exam/data/datasources/exam_local_data_source.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_exam_entity.dart';

@Injectable(as: ExamLocalDataSource)
class ExamLocalDataSourceIm implements ExamLocalDataSource {
  @override
  Future<void> storeExamLocaly(SolvedExamEntity solvedExamEntity) async {
    final exameBox = Hive.box<SolvedExamEntity>(AppConstants.examBoxName);
    await exameBox.add(solvedExamEntity);
  }
}
