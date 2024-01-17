import 'package:flutter_widgets/listViewSearchBar/services/item_locator.dart';
import 'package:flutter_widgets/listViewSearchBar/services/item_service.dart';

ItemService get itemService => itemLocator.get<ItemService>();
