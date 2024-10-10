import 'package:afeco/app/data/models/option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveFoodFormController extends GetxController {
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
  RxString sharing = 'Neighbourhood'.obs;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController typeAlimentController = TextEditingController();
  final TextEditingController quantiteController = TextEditingController();

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

  // Méthode pour soumettre le formulaire
  void submitForm() {
    // Traitement des données du formulaire (enregistrement, envoi, etc.)
    print('Données du formulaire :');
    print('Type d\'aliment : ${typeAlimentController.text}');
    print('Quantité : ${quantiteController.text}');
    // ... autres données
  }
}
