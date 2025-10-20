import 'package:injectable/injectable.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_exam_entity.dart';
import 'package:online_exam/features/main_layout/results/domain/repositories/result_repo.dart';

@injectable
class GetResultsUseCase {
  final ResultRepo _resultRepo;
  GetResultsUseCase(this._resultRepo);

  List<SolvedExamEntity> invoke() => _resultRepo.getSolvedExams();
}
