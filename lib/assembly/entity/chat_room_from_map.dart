import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/utils/date_utils.dart';

@Injectable(as: Factory<types.Room?, Map<String, dynamic>>)
class ChatRoomFromMap implements Factory<types.Room?, Map<String, dynamic>> {
  @override
  types.Room? create(Map<String, dynamic> param) {
    final data = Map<String, dynamic>.from(param);

    data['createdAt'] =
        DateUtils.convertToDateTime(data['createdAt']).millisecondsSinceEpoch;
    data['updatedAt'] =
        DateUtils.convertToDateTime(data['updatedAt']).millisecondsSinceEpoch;

    return types.Room(
      id: data['id'] as String,
      type: types.RoomType.direct,
      users: data['users'] as List<types.User>,
    );
  }
}
