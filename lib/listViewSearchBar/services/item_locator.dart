import 'package:flutter_widgets/listViewSearchBar/services/item_service.dart';
import 'package:get_it/get_it.dart';

final itemLocator = GetIt.I;

void configureItemService() {
  itemLocator.registerSingleton<ItemService>(ItemService());
}
