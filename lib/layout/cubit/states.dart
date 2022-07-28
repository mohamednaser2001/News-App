


abstract class NewsAppStates{}
class NewsAppInitialState extends NewsAppStates{}
class NewsAppChangeBottomNavBarState extends NewsAppStates{}
class NewsAppChangeAppModeState extends NewsAppStates{}


class NewsAppBusinessLoadingState extends NewsAppStates{}
class NewsAppBusinessGetDataState extends NewsAppStates{}
class NewsAppBusinessErrorState extends NewsAppStates{
  String error ;
  NewsAppBusinessErrorState(this.error);
}


class NewsAppSportsLoadingState extends NewsAppStates{}
class NewsAppSportsGetDataState extends NewsAppStates{}
class NewsAppSportsErrorState extends NewsAppStates{
  String error ;
  NewsAppSportsErrorState(this.error);
}


class NewsAppScienceLoadingState extends NewsAppStates{}
class NewsAppScienceGetDataState extends NewsAppStates{}
class NewsAppScienceErrorState extends NewsAppStates{
  String error ;
  NewsAppScienceErrorState(this.error);
}


class NewsAppSearchLoadingState extends NewsAppStates{}
class NewsAppSearchGetDataState extends NewsAppStates{}
class NewsAppSearchErrorState extends NewsAppStates{
  String error ;
  NewsAppSearchErrorState(this.error);
}