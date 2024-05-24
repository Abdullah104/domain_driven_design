import 'dart:ui';

import 'package:domain_driven_design/domain/core/failures.dart';
import 'package:domain_driven_design/domain/core/value_objects.dart';
import 'package:domain_driven_design/domain/core/value_transformers.dart';
import 'package:domain_driven_design/domain/core/value_validators.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kt_dart/kt.dart';

class NoteBody extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

  factory NoteBody(String input) => NoteBody._(
        validateMaxStringLength(input, maxLength)
            .flatMap(validateStringNotEmpty),
      );

  const NoteBody._(this.value);
}

class TodoName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory TodoName(String input) => TodoName._(
        validateMaxStringLength(input, maxLength)
            .flatMap(validateStringNotEmpty)
            .flatMap(validateSingleLine),
      );

  const TodoName._(this.value);
}

class NoteColor extends ValueObject<Color> {
  @override
  final Either<ValueFailure<Color>, Color> value;

  static const predefinedColors = [
    Color(0xfffafafa), // canvas
    Color(0xfffa8072), // salmon
    Color(0xfffedc56), // mustard
    Color(0xffd0f0c0), // tea
    Color(0xfffca3b7), // flamingo
    Color(0xff997950), // tortilla
    Color(0xfffffdd0), // cream
  ];

  factory NoteColor(Color input) => NoteColor._(right(makeColorOpaque(input)));

  const NoteColor._(this.value);
}

class List3<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 3;

  int get length => value.getOrElse((_) => emptyList()).size;
  bool get isFull => length == maxLength;

  factory List3(KtList<T> input) =>
      List3._(validateMaxListLength(input, maxLength));

  const List3._(this.value);
}
