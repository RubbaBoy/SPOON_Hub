import 'package:uuid/uuid.dart';

final Uuid uuid = Uuid();

typedef Json = Map<String, dynamic>;

String genUuid() => uuid.v4();