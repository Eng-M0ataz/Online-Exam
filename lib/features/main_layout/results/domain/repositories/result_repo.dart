import 'package:online_exam/features/main_layout/results/domain/entities/solved_exam_entity.dart';

abstract interface class ResultRepo {
  List<SolvedExamEntity> getSolvedExams();
}
