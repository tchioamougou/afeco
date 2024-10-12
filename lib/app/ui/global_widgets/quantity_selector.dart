import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final int initialQuantity;
  final int minValue;
  final int maxValue;
  final void Function(int quantity) onQuantityChanged;

  const QuantitySelector({
    super.key,
    required this.initialQuantity,
    required this.onQuantityChanged,
    required this.minValue,
    required this.maxValue,

  });

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int _quantity = 0;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity.clamp(widget.minValue, widget.maxValue);
  }

  void _incrementQuantity() {
    setState(() {
      if (_quantity < widget.maxValue) {
        _quantity++;
        widget.onQuantityChanged(_quantity);
      }
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > widget.minValue) {
        _quantity--;
        widget.onQuantityChanged(_quantity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(3000),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: _decrementQuantity,
            icon: const Icon(Icons.remove),
            style: ElevatedButton.styleFrom(
                backgroundColor: Constants.defaultBorderColor.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
            )
          ),
          Text(
            '$_quantity',
            style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
          ),
          IconButton(
            onPressed: _incrementQuantity,
            icon: const Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants.defaultBorderColor.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              )
          ),
        ],
      ),
    );
  }
}
