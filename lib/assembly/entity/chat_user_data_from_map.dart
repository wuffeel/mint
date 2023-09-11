import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_assembly.dart';
import 'package:mint_core/mint_utils.dart';

@Injectable(as: Factory<types.User, Map<String, dynamic>>)
class ChatUserDataFromMap implements Factory<types.User, Map<String, dynamic>> {
  @override
  types.User create(Map<String, dynamic> param) {
    final data = Map<String, dynamic>.from(param);

    data['createdAt'] = DateTimeUtils.convertToDateTime(data['createdAt'])
        .millisecondsSinceEpoch;
    data['lastSeen'] = DateTimeUtils.convertToDateTime(data['lastSeen'])
        .millisecondsSinceEpoch;
    data['updatedAt'] = DateTimeUtils.convertToDateTime(data['updatedAt'])
        .millisecondsSinceEpoch;

    return types.User.fromJson(data);
  }
}
