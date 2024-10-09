import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveFoodFormController extends GetxController {
  List<String> sharingPlaces = ['Neighbourhood', 'Food bank'];
  List<String> typePackaging = ['Fresh', 'frozen', 'canned'];
  List<String> packagingConditions = [
    'intact',
    'damaged',
  ];
  List<String> allergens = ['gluten', 'lactose', 'nuts'];
  List<String> restrictions = ['gluten', 'lactose', 'nuts'];
  List<String> preferredRecoveryModes = [
    'home collection',
    'drop-off at a collection point',
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
