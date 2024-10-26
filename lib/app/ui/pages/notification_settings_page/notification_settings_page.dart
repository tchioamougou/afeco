import 'package:afeco/app/data/models/global_service.dart';
import 'package:afeco/app/data/models/user_model.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _isEmailNotificationsEnabled =
      UserService.instance.user!.isEmailNotificationsEnabled;
  bool _isCalendarRemindersEnabled =
      UserService.instance.user!.isCalendarRemindersEnabled;
  bool _isImportantUpdatesEnabled =
      UserService.instance.user!.isImportantUpdatesEnabled;
  bool _isPushNotification = UserService.instance.user!.isPushNotification;
  bool _isAnnouncementsEnabled =
      UserService.instance.user!.isAnnouncementsEnabled;
  List<int> _selectedDays = UserService.instance.user!.reminderDays;
  bool changed = false;
  void haveChange() {
    changed = _isEmailNotificationsEnabled !=
            UserService.instance.user!.isEmailNotificationsEnabled ||
        _isCalendarRemindersEnabled !=
            UserService.instance.user!.isCalendarRemindersEnabled ||
        _isImportantUpdatesEnabled !=
            UserService.instance.user!.isImportantUpdatesEnabled ||
        _isPushNotification != UserService.instance.user!.isPushNotification ||
        _isAnnouncementsEnabled !=
            UserService.instance.user!.isAnnouncementsEnabled ||
        _selectedDays != UserService.instance.user!.reminderDays;
  }

  Future<void> saveChange() async {
    EasyLoading.show();
    try {
      UserModel us = UserService.instance.user!;
      us.isEmailNotificationsEnabled = _isEmailNotificationsEnabled;
      us.isCalendarRemindersEnabled = _isCalendarRemindersEnabled;
      us.isImportantUpdatesEnabled = _isImportantUpdatesEnabled;
      us.isPushNotification = _isPushNotification;
      us.isAnnouncementsEnabled = _isAnnouncementsEnabled;
      us.reminderDays = _selectedDays;
      UserService.instance.user = us;
      await GlobalService.updateUserNotification();
    } catch (e) {
      EasyLoading.showError('errorOccur'.tr);
    } finally {
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'notifications'.tr,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildNotificationSetting(
                title: 'email'.tr,
                subtitle: 'emailNotSettingsText'.tr,
                value: _isEmailNotificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _isEmailNotificationsEnabled = value;
                    haveChange();
                  });
                },
              ),
              // Calendar Reminders
              buildNotificationSetting(
                title: 'calenderReminder'.tr,
                subtitle: 'calendarReminderText'.tr,
                value: _isCalendarRemindersEnabled,
                onChanged: (value) {
                  setState(() {
                    _isCalendarRemindersEnabled = value;
                    haveChange();
                  });
                },
              ),
              buildNotificationSetting(
                title: 'pushNotification'.tr,
                subtitle: 'pushNotificationText'.tr,
                value: _isPushNotification,
                onChanged: (value) {
                  setState(() {
                    _isPushNotification = value;
                    haveChange();
                  });
                },
              ),
              buildNotificationSettingCheckbox(
                  title: 'importantUpdates'.tr,
                  subtitle: 'importantUpdatesText'.tr,
                  onChanged: (va) {
                    setState(() {
                      _isImportantUpdatesEnabled = va ?? false;
                    });
                  },
                  value: _isImportantUpdatesEnabled),
              // Announcements and Promotions
              buildNotificationSettingCheckbox(
                  title: 'announcePromo'.tr,
                  subtitle: 'announcePromoText'.tr,
                  onChanged: (va) {
                    setState(() {
                      _isAnnouncementsEnabled = va ?? false;
                      haveChange();
                    });
                  },
                  value: _isAnnouncementsEnabled),
              ListTile(
                title: Text(
                  'dailyReminder'.tr,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("dailyReminderText".tr),
                dense: true,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDaysOfWeekSelector(onChanged: (i) {
                      setState(() {
                        if (_selectedDays.contains(i)) {
                          _selectedDays.remove(i);
                        } else {
                          _selectedDays.add(i);
                        }
                        _selectedDays.sort();
                        haveChange();
                      });
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        getLabelDays(),
                        style: TextStyle(
                            color: Constants.defaultBorderColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
                child: CustomButton(
                    onPressed: () {
                      haveChange();
                      if (changed) {
                        saveChange();
                      }
                    },
                    disable: !changed,
                    text: 'save'.tr,
                    backgroundColor: Constants.buttonColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNotificationSetting({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    Widget? trailing,
  }) {
    return ListTile(
      dense: true,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Constants.defaultHeaderColor,
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget buildNotificationSettingCheckbox({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return ListTile(
      dense: true,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Constants.defaultHeaderColor,
          ),
        ],
      ),
    );
  }

  Widget buildDaysOfWeekSelector({required ValueChanged<int> onChanged}) {
    return Row(
      children: List.generate(7, (index) {
        return InkWell(
            onTap: () {
              onChanged(index);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                      color: Constants.defaultBorderColor.withOpacity(0.2),
                      width: 0.2),
                  color: _selectedDays.contains(index)
                      ? Constants.defaultBorderColor
                      : Colors.white),
              child: Text(
                getWeekdayName(index).substring(0, 2),
                style: TextStyle(
                    color: _selectedDays.contains(index)
                        ? Colors.white
                        : Constants.defaultBorderColor),
              ),
            ));
      }),
    );
  }

  String getWeekdayName(weekdayNumber) {
    const weekdays = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];

    if (weekdayNumber >= 0 && weekdayNumber < 7) {
      return weekdays[weekdayNumber];
    } else {
      return "Invalid weekday number";
    }
  }

  String getLabelDays() {
    if (_selectedDays.length == 7) {
      return 'everyDay'.tr;
    } else {
      String val = "";
      for (var i in _selectedDays) {
        val += (val.isNotEmpty ? ', ' : '') + getWeekdayName(i);
      }
      return val;
    }
  }
}
