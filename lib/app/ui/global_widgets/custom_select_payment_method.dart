import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../data/models/option.dart';

class CustomSelectPaymentMethod extends StatefulWidget {
  final Function(String) onChanged;
  const CustomSelectPaymentMethod({
    super.key,
    required this.onChanged,
  });

  @override
  State<CustomSelectPaymentMethod> createState() =>
      _CustomSelectPaymentMethodState();
}

class _CustomSelectPaymentMethodState extends State<CustomSelectPaymentMethod> {
  final List<Option> options = [
    Option(
        value: SelectPaymentMethod.creditCard.name,
        label:
            'https://toppng.com/uploads/preview/credit-card-11530978339malxaqcd71.png'),
    Option(
        value: SelectPaymentMethod.mobile.name,
        label: 'https://docs.cinetpay.com/images/latest_ci4.png')
  ];
  String selectMethod = '';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...options.map((op) => InkWell(
              onTap: () {
                setState(() {
                  selectMethod = op.value;
                  widget.onChanged(selectMethod);
                });
              },
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: selectMethod == op.value
                          ? Constants.buttonColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  child: Image.network(
                    op.label,
                    width: 70,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
