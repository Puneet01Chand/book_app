import 'package:auto_route/auto_route.dart';
import 'package:new_project/routes/app_router.gr.dart';

final AppRouter appRouter = AppRouter();

@AutoRouterConfig(replaceInRouteName: 'Screen|Page|View|Widget,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page,initial: true),
    AutoRoute(page: FavouriteRoute.page),
    AutoRoute(page: SearchRoute.page),
  ];
}