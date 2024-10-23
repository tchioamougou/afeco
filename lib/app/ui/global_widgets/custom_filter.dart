import 'package:afeco/app/data/models/filter_model.dart';
import 'package:afeco/app/data/services/filter_service.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFilter extends StatefulWidget {
  final VoidCallback onClose;
  final VoidCallback onPress;
  const CustomFilter({super.key, required this.onClose, required this.onPress});

  @override
  State<CustomFilter> createState() => _CustomFilterState();
}

class _CustomFilterState extends State<CustomFilter> {
  FilterModel fm = FilterService.instance.filter;
  @override
  Widget build(BuildContext context) {
    List<String> bagTypes = ['Meals', "Bread & Pastries", "Groceries", "Other"];
    List<String> pickupDays = ['Today', "Tomorrow"];
    List<String> dietPreferences = ['Vegetarian', "Vegan"];
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: widget.onClose, icon: const Icon(Icons.close))
                ],
              ),
              const Text(
                'Filters',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
              SizedBox(
                height: 5.h,
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(
                          title: 'showSoldOut'.tr,
                          color: Colors.black,
                        ),
                        Switch(
                          value: fm.showSoldHow,
                          onChanged: (val) {
                            setState(() {
                              fm.showSoldHow = !fm.showSoldHow;
                            });
                          },
                          activeColor: Constants.buttonColor,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(
                          title: 'showBioGaz'.tr,
                          color: Colors.black,
                        ),
                        Switch(
                          value: fm.showWasterForBiogas,
                          onChanged: (val) {
                            setState(() {
                              fm.showWasterForBiogas = val;
                            });
                          },
                          activeColor: Constants.buttonColor,
                        )
                      ],
                    ),
                    Label(
                      title: "pickupDay".tr,
                      color: Colors.black87,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: pickupDays
                            .map((e) => CustomFilterBtn(
                                  title: e,
                                  maxHeight:
                                      MediaQuery.sizeOf(context).width * 0.45,
                                  onChange: (val) {
                                    setState(() {
                                      if (fm.pickupDay.contains(e)) {
                                        fm.pickupDay.remove(e);
                                      } else {
                                        fm.pickupDay.add(e);
                                      }
                                    });
                                  },
                                  isSelected: fm.pickupDay.contains(e),
                                ))
                            .toList()),
                    Label(
                      title: "pickupWindow".tr,
                      color: Colors.black87,
                    ),
                    if (fm.pickupWindow.start == 0 && fm.pickupWindow.end == 24)
                      Text('allDay'.tr)
                    else
                      Text(
                          '${fm.pickupWindow.start.toInt()}h - ${fm.pickupWindow.end.toInt()}h'),
                    RangeSlider(
                      activeColor: Constants.buttonColor,
                      values: fm.pickupWindow,
                      divisions: 24,
                      onChanged: (val) {
                        setState(() {
                          fm.pickupWindow = val;
                        });
                      },
                      max: 24,
                      min: 0,
                    ),
                    Label(
                      title: "bagTypes".tr,
                      color: Colors.black87,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        child: Row(
                            children: bagTypes
                                .map((e) => CustomFilterBtn(
                                      title: e,
                                      onChange: (val) {
                                        setState(() {
                                          if (fm.bagTypes.contains(e)) {
                                            fm.bagTypes.remove(e);
                                          } else {
                                            fm.bagTypes.add(e);
                                          }
                                        });
                                      },
                                      isSelected: fm.bagTypes.contains(e),
                                    ))
                                .toList()),
                      ),
                    ),
                    Label(
                      title: "dietaryPreference".tr,
                      color: Colors.black87,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: dietPreferences
                            .map((e) => CustomFilterBtn(
                                  title: e,
                                  maxHeight:
                                      MediaQuery.sizeOf(context).width * 0.45,
                                  onChange: (val) {
                                    setState(() {
                                      if (fm.dietaryPreferences.contains(e)) {
                                        fm.dietaryPreferences.remove(e);
                                      } else {
                                        fm.dietaryPreferences.add(e);
                                      }
                                    });
                                  },
                                  isSelected: fm.dietaryPreferences.contains(e),
                                ))
                            .toList()),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
          Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                          color: Constants.buttonColor.withOpacity(0.3),
                          width: 1),
                    )),
                width: MediaQuery.sizeOf(context).width,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      color: Colors.white,
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      child: TextButton(
                        onPressed: () {
                          FilterService.instance.reset();
                          widget.onPress();
                        },
                        child: Text('clearAll'.tr,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      child: CustomButton(
                          onPressed: () {
                            FilterService.instance.filter = fm;
                            widget.onPress();
                          },
                          text: 'apply'.tr,
                          backgroundColor: Constants.buttonColor),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class CustomFilterBtn extends StatefulWidget {
  final double? maxHeight;
  final String title;
  bool isSelected;
  final Icon? icon;
  final Function(bool val) onChange;
  CustomFilterBtn(
      {super.key,
      this.maxHeight,
      required this.title,
      this.isSelected = false,
      required this.onChange,
      this.icon});

  @override
  State<CustomFilterBtn> createState() => _CustomFilterBtnState();
}

class _CustomFilterBtnState extends State<CustomFilterBtn> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          width: widget.maxHeight,
          decoration: BoxDecoration(
              color: widget.isSelected ? Constants.buttonColor : Colors.white,
              borderRadius: BorderRadius.circular(10)),
          constraints: BoxConstraints(
              maxHeight:
                  widget.maxHeight ?? MediaQuery.sizeOf(context).width * 0.5),
          child: TextButton(
              onPressed: () {
                setState(() {
                  widget.isSelected = !widget.isSelected;
                  widget.onChange(widget.isSelected);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null) widget.icon!,
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: widget.isSelected
                            ? Colors.white
                            : Constants.buttonColor),
                  ),
                ],
              ))),
    );
  }
}
