import 'package:domain_driven_design/domain/core/failures.dart';
import 'package:domain_driven_design/domain/core/value_objects.dart';
import 'package:domain_driven_design/domain/notes/value_objects.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';

@freezed
class TodoItem with _$TodoItem {
  const TodoItem._();

  factory TodoItem({
    required UniqueId id,
    required TodoName name,
    required bool done,
  }) = _TodoItem;

  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(''),
        done: false,
      );

  Option<ValueFailure<dynamic>> get failureOption => name.value.getLeft();
}
