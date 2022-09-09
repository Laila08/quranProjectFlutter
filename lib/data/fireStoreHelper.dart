import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quranproject/model/PryringCatModel.dart';
import 'package:quranproject/model/allPryCatModel.dart';
import 'package:quranproject/model/azkarCat.dart';
import 'package:quranproject/model/contentAzkarModel.dart';
import 'package:quranproject/model/rosaryChat.dart';

class FireStoreHelper{
  FireStoreHelper._();
  static FireStoreHelper fireStoreHelper = FireStoreHelper._();
  FirebaseFirestore  firebaseInstance = FirebaseFirestore.instance;
  //////////////////////////////////////////////AzkarCategory/////////////////////////////////////////////////////////
  CollectionReference<Map<String, dynamic>>  firebaseInstancecategory = FirebaseFirestore.instance.collection('azkarCategories');

  Future<List<AzkarCatModel>> getAzkarCategoryFromFireStore()async{
    QuerySnapshot<Map<String, dynamic>> querySnapshot =await firebaseInstancecategory.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> DocumentSnapshot= querySnapshot.docs;
    List<AzkarCatModel> azkarCategory=DocumentSnapshot.map((e){
      AzkarCatModel azkarCatModel=AzkarCatModel.fromMap(e.data());
      azkarCatModel.catId=e.id;
      return azkarCatModel;
    }).toList();
    return azkarCategory;
  }
  ///////////////////////////////////////////////ContentAzkar///////////////////////////////////////////////////////////////
  Future<List<ContentAzkarModel>> getAllContentAzkar(String catId)async{
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseInstancecategory.doc(catId).collection('azkarContents').get();
    List<ContentAzkarModel> products = querySnapshot.docs.map((e) {
      Map<String,dynamic> data = e.data();
      data['id'] = e.id;
      ContentAzkarModel contentAzkarModel = ContentAzkarModel.fromMap(data);
      return contentAzkarModel;
    } ).toList();
    return products;
  }
//////////////////////////////////////////////////Rosary////////////////////////////////////////////////////////////
  CollectionReference<Map<String, dynamic>>  firebaseInstancerosary = FirebaseFirestore.instance.collection('rosaries');

  Future<RosaryCatModel> addRosaryToFireStore(RosaryCatModel rosaryCatModel)async{
    DocumentReference<Map<String, dynamic>> documentReference = await firebaseInstancerosary.add(rosaryCatModel.toMap());
    rosaryCatModel.catId=documentReference.id;
    return rosaryCatModel;
  }
  Future<List<RosaryCatModel>> getRosaryFromFireStore()async{
    QuerySnapshot<Map<String, dynamic>> querySnapshot =await firebaseInstancerosary.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> DocumentSnapshot= querySnapshot.docs;
    List<RosaryCatModel> categories=DocumentSnapshot.map((e){
      RosaryCatModel category=RosaryCatModel.fromMap(e.data());
      category.catId=e.id;
      return category;
    }).toList();
    return categories;
  }
  deleteCategoryRosary(RosaryCatModel rosaryCatModel)async {
    await firebaseInstancerosary.doc(rosaryCatModel.catId).delete();
  }
  updateCategoryRosary(RosaryCatModel rosaryCatModel) async{
    await firebaseInstancerosary.doc(rosaryCatModel.catId).update(rosaryCatModel.toMap());
  }
  //////////////////////////////////////////////myPryCategory/////////////////////////////////////////////////////////
  CollectionReference<Map<String, dynamic>>  firebaseInstanAllPry = FirebaseFirestore.instance.collection('AllPryCategories');

  Future<List<PryCatModel>> getAllPryFromFireStore()async{
    QuerySnapshot<Map<String, dynamic>> querySnapshot =await firebaseInstanAllPry.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> DocumentSnapshot= querySnapshot.docs;
    List<PryCatModel> azkarCategory=DocumentSnapshot.map((e){
      PryCatModel azkarCatModel=PryCatModel.fromMap(e.data());
      azkarCatModel.catId=e.id;
      return azkarCatModel;
    }).toList();
    return azkarCategory;
  }
  //////////////////////////////////////////////////AllPry////////////////////////////////////////////////////////////
  CollectionReference<Map<String, dynamic>>  firebaseInstancemyPry = FirebaseFirestore.instance.collection('myPryCategories');

  Future<AllPryCatModel> addPryToFireStore(AllPryCatModel allPryCatModel)async{
    DocumentReference<Map<String, dynamic>> documentReference = await firebaseInstancemyPry.add(allPryCatModel.toMap());
    allPryCatModel.catId=documentReference.id;
    return allPryCatModel;
  }
  Future<List<AllPryCatModel>> getPryFromFireStore()async{
    QuerySnapshot<Map<String, dynamic>> querySnapshot =await firebaseInstancemyPry.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> DocumentSnapshot= querySnapshot.docs;
    List<AllPryCatModel> categories=DocumentSnapshot.map((e){
      AllPryCatModel allPryCatModel=AllPryCatModel.fromMap(e.data());
      allPryCatModel.catId=e.id;
      return allPryCatModel;
    }).toList();
    return categories;
  }
  deleteCategoryPry(AllPryCatModel allPryCatModel)async {
    await firebaseInstancemyPry.doc(allPryCatModel.catId).delete();
  }
  updateCategoryPry(AllPryCatModel allPryCatModel) async{
    await firebaseInstancemyPry.doc(allPryCatModel.catId).update(allPryCatModel.toMap());
  }
}