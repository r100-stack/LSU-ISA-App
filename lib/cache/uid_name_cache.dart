import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isa_app/constants/firebase_constants.dart';
import 'package:isa_app/utils/user_1_utils.dart';
import 'package:roipil_authentication/models/roipil_user.dart';

class UidNameCache {
  Map<String, String> _uidNameMap = {};

  Future<String> getUserName(String uid) async {
    if (_uidNameMap.containsKey(uid)) {
      return _uidNameMap[uid];
    } else {
      // TODO: What if the user doesn't exist? May not be possible, but just a thought.
      DocumentSnapshot snapshot = await kRoipilUsersRef.doc(uid).get();
      RoipilUser roipilUser = RoipilUser();
      roipilUser.updateRoipilUser(null, snapshot);

      _uidNameMap[uid] = User1Utils.getDisplayName(roipilUser.name);
      return _uidNameMap[uid];
    }
  }
}
