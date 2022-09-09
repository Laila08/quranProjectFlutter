import 'package:flutter/material.dart';
import 'package:quranproject/data/fireStoreHelper.dart';
import 'package:quranproject/model/PryringCatModel.dart';
import 'package:quranproject/model/allPryCatModel.dart';
import 'package:quranproject/model/azkarCat.dart';
import 'package:quranproject/model/contentAzkarModel.dart';
import 'package:quranproject/model/rosaryChat.dart';

class FireStoreProvider extends ChangeNotifier{
  FireStoreProvider(){
    getAllAzkarCategory();
    getAllRosary();
    getAllPryCatCategory();
    getMyPry();
  }
  validateNull(String x){
    if(x.length<4){
      return 'يجب ان يحتوي العنوان على 4 احرف على الاقل ';
    }
  }
  validateCount(String x){
    if(x.isEmpty||int.parse(x)<1){
      return 'يجب ان يكون التكرار واحد او اكثر ';
    }
  }
  List<AzkarCatModel> azkarCatList = [];
  List<PryCatModel> pryCatList = [];
  List<ContentAzkarModel> contentAzkarList = [];
  List<RosaryCatModel> rosaryCatList = [];
  List<AllPryCatModel> allPryList = [];
  TextEditingController pryNameController = TextEditingController();
  TextEditingController pryCountController = TextEditingController();
  TextEditingController RosaryNameController = TextEditingController();
  TextEditingController RosaryCountController = TextEditingController();
   //late bool isGreen;


  getAllAzkarCategory()async{
    azkarCatList = await FireStoreHelper.fireStoreHelper.getAzkarCategoryFromFireStore();
    notifyListeners();
  }
  getAllProduct(String catId)async{
    contentAzkarList.clear();
    notifyListeners();
    contentAzkarList = await FireStoreHelper.fireStoreHelper.getAllContentAzkar(catId);
    notifyListeners();
  }
  getAllRosary()async{
    rosaryCatList = await FireStoreHelper.fireStoreHelper.getRosaryFromFireStore();
    notifyListeners();
  }
  addNewRosary()async{
      RosaryCatModel rosaryCatModel = RosaryCatModel(name:RosaryNameController.text,count: int.parse(RosaryCountController.text));
      FireStoreHelper.fireStoreHelper.addRosaryToFireStore(rosaryCatModel);
      RosaryNameController.clear();
      RosaryCountController.clear();
      getAllRosary();
  }
  updateRosary(RosaryCatModel rosaryCatModel)async{
    RosaryCatModel newRosary = RosaryCatModel(
        name: RosaryNameController.text,
        count:int.parse(RosaryCountController.text));
    newRosary.catId=rosaryCatModel.catId;
    await FireStoreHelper.fireStoreHelper.updateCategoryRosary(newRosary);
    RosaryNameController.clear();
    RosaryCountController.clear();
    getAllRosary();
  }
  deleteRosary(RosaryCatModel rosaryCatModel)async{
    await  FireStoreHelper.fireStoreHelper.deleteCategoryRosary(rosaryCatModel);
    rosaryCatList.removeWhere((element) => element.catId==rosaryCatModel.catId);
    notifyListeners();
  }
  getAllPryCatCategory()async{
    pryCatList = await FireStoreHelper.fireStoreHelper.getAllPryFromFireStore();
    notifyListeners();
  }
  ////////////////////////////////////////////////////////////////////////////////////////////
  getMyPry()async{
    allPryList = await FireStoreHelper.fireStoreHelper.getPryFromFireStore();
    notifyListeners();
  }

  addNewMyPry()async{
    AllPryCatModel allPryCatModel = AllPryCatModel(name:pryNameController.text,count: int.parse(pryCountController.text));
    FireStoreHelper.fireStoreHelper.addPryToFireStore(allPryCatModel);
    pryNameController.clear();
    pryCountController.clear();
    getMyPry();
  }
  updateMyPry(AllPryCatModel allPryCatModel)async{
    AllPryCatModel newRosary = AllPryCatModel(
        name: pryNameController.text,
        count:int.parse(pryCountController.text));
    newRosary.catId=allPryCatModel.catId;
    await FireStoreHelper.fireStoreHelper.updateCategoryPry(newRosary);
    pryNameController.clear();
    pryCountController.clear();
    getMyPry();
  }
  deleteMyPry(AllPryCatModel allPryCatModel)async{
    await  FireStoreHelper.fireStoreHelper.deleteCategoryPry(allPryCatModel);
    allPryList.removeWhere((element) => element.catId==allPryCatModel.catId);
    notifyListeners();
  }
}