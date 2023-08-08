import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/utils/date_utils.dart';

@Injectable(as: Factory<types.User, Map<String, dynamic>>)
class ChatUserDataFromMap implements Factory<types.User, Map<String, dynamic>> {
  @override
  types.User create(Map<String, dynamic> param) {
    final data = Map<String, dynamic>.from(param);

    data['createdAt'] =
        DateUtils.convertToDateTime(data['createdAt']).millisecondsSinceEpoch;
    data['lastSeen'] =
        DateUtils.convertToDateTime(data['lastSeen']).millisecondsSinceEpoch;
    data['updatedAt'] =
        DateUtils.convertToDateTime(data['updatedAt']).millisecondsSinceEpoch;

    return types.User.fromJson(data);
  }
}
