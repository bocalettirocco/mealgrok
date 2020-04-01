import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mealgrok/models/nutrient.dart';
import 'package:mealgrok/controllers/nutrient_controller.dart';



class NutrientGraph extends StatelessWidget {
  static const String graphId = 'nutrients';

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: NutrientController.getNutrients(DateTime.now()),
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
        }

        List<charts.Series<Nutrient, String>> series = [
          charts.Series(
            id: graphId,
            data: snapshot.data,
            domainFn: (Nutrient series, _) => '${series.nutrientName}\n(${series.units})',
            measureFn: (Nutrient series, _) => series.value,
            colorFn: (Nutrient series, _) => series.barColor,
        )];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: charts.BarChart(
            series, 
            animate: true,
            customSeriesRenderers: [
              charts.BarTargetLineRendererConfig<String>(
              // ID used to link series to this renderer.
              customRendererId: 'customTargetLine',
              groupingType: charts.BarGroupingType.stacked)
            ],
          ),
        );
      }
    );
  }

}