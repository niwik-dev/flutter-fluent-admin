import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_admin/service/network_info/network_info_service.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:responsive_toolkit/breakpoints.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:responsive_toolkit/responsive_layout.dart';

part 'p_network_info_view.g.dart';

@hwidget
Widget pageNetworkInfoView(BuildContext context){ 
  NetworkInfoService service = NetworkInfoService();
  var wifiName = useState<String?>(null);
  var wifiIP = useState<String?>(null);
  var wifiGatewayIP = useState<String?>(null);
  var wifiBSSID = useState<String?>(null);

  useEffect(() {
    service.getWifiName().then((value) {
      wifiName.value = value;
    });

    service.getWifiIP().then((value) {
      wifiIP.value = value;
    });

    service.getWifiGatewayIP().then((value) {
      wifiGatewayIP.value = value;
    });

    service.getWifiBSSID().then((value) {
      wifiBSSID.value = value;
    });
  }, []);

  return Wrap(
    children: [
      if(wifiName.value != null)
      ListTile(
        leading: const Icon(
          FluentIcons.wifi,
          size: 32,
        ),
        title: const Text('Wifi名称'),
        trailing: Text(wifiName.value!),
      ),
      if(wifiIP.value != null)
      ListTile(
        leading: const Icon(
          FluentIcons.my_network,
          size: 32,
        ),
        title: const Text('IP地址'),
        trailing: Text(wifiIP.value!),
      ),
      if(wifiGatewayIP.value != null)
      ListTile(
        leading: const Icon(
          FluentIcons.network_tower,
          size: 32,
        ),
        title: const Text('网关地址'),
        trailing: Text(wifiGatewayIP.value!),
      ),
      if(wifiBSSID.value != null)
      ListTile(
        leading: const Icon(
          FluentIcons.dom,
          size: 32,
        ),
        title: const Text('BSSID'),
        trailing: Text(wifiBSSID.value!),
      ),
    ],
  );
}

ResponsiveColumn buildPageNetworkInfoViewInColumn(BuildContext context){ 
  return ResponsiveColumn.span(
    span: ResponsiveLayout.value(
      context,
      Breakpoints(
        xs: 12,
        sm: 6,
        md: 6,
        lg: 3
      )
    ),
    child: const SizedBox(
      height: 200,
      child: Center(
        child: PageNetworkInfoView(),
      )
    )
  );
}