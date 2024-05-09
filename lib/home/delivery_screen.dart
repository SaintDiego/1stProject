import 'package:flutter/material.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Условия доставки в США:',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Мы осуществляем доставку животных в США с помощью авиаперевозок. '
                'Стоимость доставки зависит от веса и размера животного, а также от города назначения.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            'Ориентировочные цены на доставку:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '- Животное весом до 5 кг: от \$500',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 5),
          Text(
            '- Животное весом от 5 до 10 кг: от \$700',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 5),
          Text(
            '- Животное весом более 10 кг: от \$1000',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            'Для получения точной стоимости доставки, пожалуйста, свяжитесь с нами.',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}