import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int wheight;

  const ImcResultScreen({
    super.key,
    required this.height,
    required this.wheight,
  });

  @override
  Widget build(BuildContext context) {
    double imcResult = wheight / ((height / 100) * (height / 100));
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(imcResult,context),
    );
  }

  Padding bodyResult(double imcResult,context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tu resultado:',
            style: TextStyle(
              fontSize: 38,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${getNameByImc(imcResult)}',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: getColorByImc(imcResult),
                      ),
                    ),
                    Text(
                      imcResult.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 76,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        getDescriptionByImc(imcResult),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: elevatedButtonFinalizar(context),
          ),
        ],
      ),
    );
  }

  ElevatedButton elevatedButtonFinalizar(context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
      ),
      child: Text('FINALIZAR', style: TextStyles.bodytext),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text('RESULTADO'),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }

  Color getColorByImc(double imcResult) {
    //Se podría optimizar muchísimo más, pero es para prácticar
    return switch (imcResult) {
      < 18.5 => Colors.blue, //IMC BAJO
      < 24.9 => Colors.green, //IMC MEDIO
      < 29.9 => Colors.yellow, //SOBREPESO
      _ => Colors.red, //OBESIDAD               //_ es para indicar un else
    };
  }

  String getNameByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => 'IMC BAJO', //IMC BAJO
      < 24.9 => 'IMC MEDIO', //IMC MEDIO
      < 29.9 => 'SOBREPESO', //SOBREPESO
      _ => 'OBESIDAD', //OBESIDAD
    };
  }

  String getDescriptionByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 =>
        'Tu peso está por debajo de lo recomendado. Consulta con un profesional de la salud.',
      < 24.9 => 'Tienes un peso saludable. Mantén buenos hábitos.',
      < 29.9 =>
        'Presentas sobrepeso. Mejorar la dieta y el ejercicio puede ayudar.',
      _ => 'El IMC indica obesidad. Es recomendable acudir a un especialista.',
    };
  }
}
