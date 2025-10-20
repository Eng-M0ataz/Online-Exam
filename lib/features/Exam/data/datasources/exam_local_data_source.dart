import 'package:online_exam/features/main_layout/results/domain/entities/solved_exam_entity.dart';

abstract interface class ExamLocalDataSource {
  Future<void> storeExamLocaly(SolvedExamEntity solvedExamEntity);
}
