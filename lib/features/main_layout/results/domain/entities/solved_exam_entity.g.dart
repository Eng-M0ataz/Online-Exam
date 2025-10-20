// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solved_exam_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SolvedExamEntityAdapter extends TypeAdapter<SolvedExamEntity> {
  @override
  final int typeId = 0;

  @override
  SolvedExamEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SolvedExamEntity(
      id: fields[0] as String,
      numberOfQuestions: fields[1] as String,
      examDuration: fields[2] as String,
      userDuration: fields[3] as String,
      numberOfCorrectAnswers: fields[4] as String,
      questions: (fields[5] as List).cast<SolvedQuestionEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, SolvedExamEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.numberOfQuestions)
      ..writeByte(2)
      ..write(obj.examDuration)
      ..writeByte(3)
      ..write(obj.userDuration)
      ..writeByte(4)
      ..write(obj.numberOfCorrectAnswers)
      ..writeByte(5)
      ..write(obj.questions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SolvedExamEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
