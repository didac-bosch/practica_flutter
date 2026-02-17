import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeighSelector extends StatefulWidget {
  final double value;
  final Function(double)
  onHeightChange; //dentro del parentesis de la función se define lo que ésta devuelve

  const HeighSelector({
    super.key,
    required this.value,
    required this.onHeightChange,
  });

  @override
  State<HeighSelector> createState() => _HeighSelectorState();
}

class _HeighSelectorState extends State<HeighSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Text('ALTURA', style: TextStyles.bodytext),
              Text(
                '${widget.value.toStringAsFixed(0)} cm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                value: widget.value,
                onChanged: (newHeight) {
                  setState(() {
                    widget.onHeightChange(newHeight);
                  });
                },
                min: 120,
                max: 200,
                divisions: 80,
                label: '${widget.value.toStringAsFixed(0)} cm', //per posar label a la barra
                activeColor: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
