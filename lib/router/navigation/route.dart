import 'package:fluent_ui/fluent_ui.dart';

class NavigationMenuRoute{
  List<NavigationPaneItem> items;
  List<NavigationPaneItem> footerItems;

  NavigationMenuRoute({required this.items, required this.footerItems});

  List<AutoSuggestBoxItem<String>> getAutoSuggestBoxItems(){
    List<AutoSuggestBoxItem<String>> resultList = [];
    for(var item in items+footerItems){
      if(item is PaneItem){
        if(item.title is! Text){
          throw Exception('PaneItem title must be Text');
        }
        resultList.add(AutoSuggestBoxItem<String>(
          value: (item.title as Text).data,
          label: (item.title as Text).data!,
        ));
      }
    }
    return resultList;
  }
}