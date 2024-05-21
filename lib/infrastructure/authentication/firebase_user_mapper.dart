import 'package:domain_driven_design/domain/authentication/user.dart' as domain;
import 'package:domain_driven_design/domain/core/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseDomainX on User {
  domain.User toDomain() => domain.User(UniqueId.fromUniqueString(uid));
}
