import 'package:cloud_firestore/cloud_firestore.dart';

class Methods{
  Future addDetails(Map<String,dynamic> detailsInfoMap,String id)async{
    return await FirebaseFirestore.instance
        .collection("details")
        .doc(id).
    set(detailsInfoMap);

  }
  Future updateDetails( String id,Map<String,dynamic> updateInfo) async{

    return await FirebaseFirestore.instance.collection("details").doc(id).update(updateInfo);
  }

  Future deleteDetails( String id) async{

    return await FirebaseFirestore.instance.collection("details").doc(id).delete();
  }

}





