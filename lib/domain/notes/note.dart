import 'package:domain_driven_design/domain/core/failures.dart';
import 'package:domain_driven_design/domain/core/value_objects.dart';
import 'package:domain_driven_design/domain/notes/todo_item.dart';
import 'package:domain_driven_design/domain/notes/value_objects.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const Note._();

  factory Note({
    required UniqueId id,
    required NoteBody body,
    required NoteColor color,
    required List3<TodoItem> todos,
  }) = _Note;

  factory Note.empty() => Note(
        id: UniqueId(),
        body: NoteBody(''),
        color: NoteColor(NoteColor.predefinedColors.first),
        todos: List3(emptyList()),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return body.failureOrUnit
        .andThen(() => todos.failureOrUnit)
        .andThen(
          () => todos
              .getOrCrash()
              // Getting [failureOption] from TodoItem ENTITY - NOT a failureOption from a VALUE OBJECT
              .map((todoItem) => todoItem.failureOption)
              .filter((o) => o.isSome())
              // If we can't get the 0th element, the list is empty. In such a case, it's valid.
              .getOrElse(0, (_) => none())
              .fold(() => right(unit), left),
        )
        .fold(some, (_) => none());
  }
}
