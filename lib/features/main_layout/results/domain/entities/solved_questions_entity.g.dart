// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solved_questions_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SolvedQuestionEntityAdapter extends TypeAdapter<SolvedQuestionEntity> {
  @override
  final int typeId = 1;

  @override
  SolvedQuestionEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SolvedQuestionEntity(
      questionId: fields[0] as String,
      question: fields[1] as String,
      inCorrectAnswer: fields[2] as String?,
      correctAnswer: fields[3] as String,
      answers: (fields[4] as List).cast<Answer>(),
    );
  }

  @override
  void write(BinaryWriter writer, SolvedQuestionEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.questionId)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.inCorrectAnswer)
      ..writeByte(3)
      ..write(obj.correctAnswer)
      ..writeByte(4)
      ..write(obj.answers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SolvedQuestionEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
