// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/main_layout/results/data/dataSource/result_local_data_source.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_exam_entity.dart';
import 'package:online_exam/features/main_layout/results/domain/repositories/result_repo.dart';

@Injectable(as: ResultRepo)
class ResultRepoImpl implements ResultRepo {
  final ResultLocalDataSource _resultLocalDataSource;
  ResultRepoImpl(this._resultLocalDataSource);
  @override
  List<SolvedExamEntity> getSolvedExams() {
    return _resultLocalDataSource.getSolvedExams();
  }
}
