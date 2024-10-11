import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/food_model.dart';
import 'package:afeco/app/data/models/giving_package.dart';
import 'package:afeco/app/data/models/option.dart';
import 'package:afeco/app/data/models/place_model.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SaveFoodFormController extends GetxController {
  final SaveFoodAppWriteController _appWriteController = Get.find();
  List<Option> sharingPlaces = [
    Option(value: "NEIGHBORHOOD", label: "Neighbourhood"),
    Option(value: "FOOD_BANK", label: "Food bank"),
  ];

  List<Option> typePackaging = [
    Option(value: "FRESH", label: "Fresh"),
    Option(value: "FROZEN", label: "Frozen"),
    Option(value: "CANNED", label: "Canned"),
  ];

  List<Option> packagingConditions = [
    Option(value: "INTACT", label: "Intact"),
    Option(value: "DAMAGED", label: "Damaged"),
  ];

  List<Option> allergens = [
    Option(value: "GLUTEN", label: "Gluten"),
    Option(value: "LACTOSE", label: "Lactose"),
    Option(value: "NUTS", label: "Nuts"),
  ];

  List<Option> restrictions = [
    Option(value: "GLUTEN", label: "Gluten"),
    Option(value: "LACTOSE", label: "Lactose"),
    Option(value: "NUTS", label: "Nuts"),
  ];

  List<Option> preferredRecoveryModes = [
    Option(value: "HOME_COLLECTION", label: "Home collection"),
    Option(value: "DROP_OFF_AT_A_COLLECTION_POINT", label: "Drop-off at a collection point"),
  ];
  List<Option> shareWiths = [
    Option(value: "NEIGHBORS", label: "Neighbors"),
  ];
  RxString sharing = 'Neighbourhood'.obs;
  final _formKey = GlobalKey<FormState>();
  RxList<FoodModel> products = <FoodModel>[].obs;
  DateTime expirationDate = DateTime.now();
  DateTime availableDate = DateTime.now();
  TimeOfDay betweenDate = TimeOfDay.now();
  TimeOfDay toDate = TimeOfDay.now();

  final TextEditingController typeAlimentController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController  firstNameController = TextEditingController();
  final TextEditingController  lastNameController = TextEditingController();
  final TextEditingController  emailController = TextEditingController();
  final TextEditingController   phoneController = TextEditingController();
   PlaceModel  address = PlaceModel();
  final TextEditingController  reasonController = TextEditingController();
  RxString typePackagingSelect = "".obs;
  RxString packagingCondition = "".obs;
  RxString allergen = "".obs;
  RxString restriction = "".obs;
  RxString preferredRecoveryMode = "".obs;
  RxString shareWith = "".obs;


  RxInt currentStep = 0.obs;
  bool isSharingWithNeighbors = false;

  void nextStep() {
    if (currentStep < 3) {
      currentStep++;
      update();
    } else {
      //Todo Save all;
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      update();
    }
  }

  void addProduct(){
    products.add(FoodModel(name: typeAlimentController.value.text, quantity: quantityController.value.text, expirationDate: expirationDate, category: 'category'));
    Get.back();
  }
  // Méthode pour soumettre le formulaire
  Future<void> submitForm() async {
      await EasyLoading.show();
      try {
        GivingPackage gp =GivingPackage(
            users: '67085e633edbcb406690',//SessionService.instance.currentSession!.userId,
            name: '${firstNameController.value.text} ${lastNameController.value.text}',
            lat: double.parse(address.lat??"0"),
            long: double.parse(address.lon??"0"),
            phone: phoneController.value.text,
            email: emailController.value.text,
            address: address.displayName??"",
            typeOfPackaging: typePackagingSelect.value,
            packagingCondition: packagingCondition.value,
            reasonForGiving: reasonController.value.text,
            products: products.map((e)=>e.toJson().toString()).toList(),
            allergens: [allergen.value],
            restrictions: [restriction.value],
            preferredRecoveryModes:preferredRecoveryMode.value,
            availableDateStart: Utils.setDateTime(availableDate, betweenDate),
            availableDateEnd: Utils.setDateTime(availableDate, toDate),
            createdDate: DateTime.now(),
            status: 'OPEN',
            reservedBy: '',
            shareWith: shareWith.value
        );
        await _appWriteController.createDocument(AppWriteCollection.givingPackagesCollections,gp.toJson() );
        Get.offAllNamed(AppRoutes.TANKING);
      } catch (e) {
        EasyLoading.showError("An Error Occur");
        print(e);
      } finally {
        EasyLoading.dismiss();
      }
    }

}
