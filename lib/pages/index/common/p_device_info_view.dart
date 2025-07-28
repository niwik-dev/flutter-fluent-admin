import 'package:async/async.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:responsive_toolkit/breakpoints.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:responsive_toolkit/responsive_layout.dart';

import '../../../service/system_info/service_info_service.dart';

part 'p_device_info_view.g.dart';

@hwidget
Widget pageDeviceInfoView(BuildContext context){
  SystemInfoService service = SystemInfoService();
  var isDataFetched = useState<bool>(false);
  var kernelInfo = useMemoized<String?>(service.getKernelInfo);
  var systemInfo = useMemoized<String?>(service.getSystemInfo);
  var coreInfo = useMemoized<String?>(service.getCoreInfo);

  useEffect(() {
    var firstLoad = CancelableOperation.fromFuture(
      Future.delayed(const Duration(seconds: 1), () {
        // kernelInfo.value = service.getKernelInfo();
        systemInfo = service.getSystemInfo();
        coreInfo = service.getCoreInfo();
        isDataFetched.value = true;
      })
    );
    return (){
      firstLoad.cancel();
    };
  },[]);
  
  return Wrap(
    children: [
      if(kernelInfo != null)
      ListTile(
        leading: const Icon(
          FluentIcons.processing,
          size: 32,
        ),
        title: const Text('系统内核'),
        subtitle: Text(kernelInfo!),
      ),
      if(systemInfo != null)
      ListTile(
        leading: const Icon(
          FluentIcons.system,
          size: 32,
        ),
        title: const Text('操作系统'),
        subtitle: Text(systemInfo!),
      ),
      if(coreInfo != null)
      ListTile(
        leading: const Icon(
          FluentIcons.pc1,
          size: 32,
        ),
        title: const Text('CPU核心'),
        subtitle: Text(coreInfo!),
      ),
    ],
  );
}

ResponsiveColumn buildPageDeviceInfoViewInColumn(BuildContext context){ 
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
        child: PageDeviceInfoView(),
      ),
    )
  );
}