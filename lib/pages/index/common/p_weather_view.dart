import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_admin/pages/index/common/p_title_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_toolkit/breakpoints.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:responsive_toolkit/responsive_layout.dart';

import '../../../model/response/realtime_weather.dart';
import '../../../utils/date_utils.dart';
import '../../../api/restful/weather_api.dart';
import '../../../model/response/daily_weather.dart';

part 'p_weather_view.g.dart';

@hwidget
Widget pageRealWeatherView(BuildContext context){
  WeatherApi api = WeatherApi();

  var temperature = useState<String?>(null);
  var locationText = useState<String?>(null);
  var weatherText = useState<String?>(null);
  var weatherLottie = useState<String?>(null);
  var updateTime = useState<DateTime?>(null);

  useEffect((){
    String sunny = "assets/lottie/weather/sunny.json";
    String cloudy = "assets/lottie/weather/sunrise.json";
    String rainy = "assets/lottie/weather/rainfall.json";

    Map<String,String> weatherMap = {
      '0':sunny,'1':sunny,'2':sunny,'3':sunny,
      '4':cloudy,'6':cloudy,'7':cloudy,'8':cloudy,
      '10':rainy,'13':rainy,'14':rainy,'15':rainy,
    };

    api.getRealTimeWeather('beijing').then((RealtimeWeatherResponse realTimeWeather){
      if(realTimeWeather.results==null || realTimeWeather.results!.isEmpty){
        return;
      }
      var now = realTimeWeather.results?.first.now;

      weatherLottie.value = weatherMap[now?.code] ?? sunny;
      temperature.value = '${now?.temperature}℃';
      weatherText.value = now?.text;

      var location = realTimeWeather.results?.first.location;
      locationText.value = '${location?.name},${location?.country}';

      updateTime.value = DateTime.parse(realTimeWeather.results!.first.lastUpdate!);
    });
    return null;
  },[]);

  return Wrap(
    alignment: WrapAlignment.center,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: [
      Row(
        children: [
          if(locationText.value != null)
          ...[
            ComboBox(
              value: locationText.value,
              items: [
                ComboBoxItem(
                  value: locationText.value,
                  child: Text(locationText.value!),
                )
              ],
              onChanged: (newValue){},
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '更新于 ${UserDateUtils.format(updateTime.value!,format: "HH:mm")}',
                style: const TextStyle(
                  fontSize: 16
                ),
              ),
            ),
          ]
        ],
      ),
      if(weatherLottie.value != null)
      LayoutBuilder(
        builder: (context, constraints) {
          return LottieBuilder.asset(
            weatherLottie.value!,
            width: constraints.maxWidth>420 ? 175 : 100,
            
          );
        },
      ),
      LayoutBuilder(
        builder: (context, constraints) {
          return Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                weatherText.value??'',
                style: TextStyle(
                  fontSize: constraints.maxWidth > 420 ? 48 : 36
                ),
              ),
              Text(
                temperature.value??'加载中...',
                style: TextStyle(
                  fontSize: constraints.maxWidth > 420 ? 24 : 18
                ),
              ),
            ],
          );
        },
      )
    ],
  );
}

@hwidget
Widget pageWeatherView(BuildContext context){
  WeatherApi api = WeatherApi();

  var dailyWeathers = useState<List<DailyWeather>?>([]);

  useEffect((){
    api.getDailyWeather('beijing').then((DailyWeatherResponse dailyWeather){
      if(dailyWeather.results==null || dailyWeather.results!.isEmpty){
        return;
      }
      dailyWeathers.value = dailyWeather.results?.first.daily;
    });
    return null;
  },[]);

  return ListView(
    children: [
      const PageRealWeatherView(),

      if(dailyWeathers.value != null)
      for(var dailyWeather in dailyWeathers.value!)
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  UserDateUtils.formatAsReableDay(
                    DateTime.parse(
                      dailyWeather.date!
                    ),
                  )
                ),
                Text(
                  UserDateUtils.format(
                    DateTime.parse(
                      dailyWeather.date!
                    ),
                    format: "MM月dd日"
                  )
                ),
              ],
            ),
            Text(
              '${dailyWeather.low!}~${dailyWeather.high!}℃',
              style: const TextStyle(
                fontSize: 32
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('昼${dailyWeather.textDay!} / 夜${dailyWeather.textNight!}'),
                Text('${dailyWeather.windDirection!}风 ${dailyWeather.windScale!}级'),
              ],
            ),
          ],
        ),
      )
    ],
  );
}

ResponsiveColumn buildPageWeatherInfoViewInColumn(BuildContext context){ 
  return ResponsiveColumn.span(
    span: ResponsiveLayout.value(
      context,
      Breakpoints(
        xs: 12,
        sm: 12,
        md: 6,
        lg: 6
      )
    ),
    child: const TitleCard(
      title: '天气',
      child: SizedBox(
        height: 200,
        child: PageWeatherView()
      )
    )
  );
}