abstract class NewsStatus {}

class NewsInitialState extends NewsStatus {}


class NewsBottomNavigationState extends NewsStatus {}

class NewsGetBusinessLoadingState extends NewsStatus {}

class NewsGetBusinessSuccessState extends NewsStatus {}

class NewsGetBusinessErrorState extends NewsStatus {
  final String err;
  NewsGetBusinessErrorState(this.err);
}

class NewsGetSportLoadingState extends NewsStatus {}

class NewsGetSportSuccessState extends NewsStatus {}

class NewsGetSportErrorState extends NewsStatus {
  final String err;
  NewsGetSportErrorState(this.err);
}

class NewsGetScienceLoadingState extends NewsStatus {}

class NewsGetScienceSuccessState extends NewsStatus {}
class NewsGetScienceErrorState extends NewsStatus {
  final String err;
  NewsGetScienceErrorState(this.err);
}

class NewsSwapLightDarkState extends NewsStatus {}

class NewsGetSearchLoadingState extends NewsStatus {}

class NewsGetSearchSuccessState extends NewsStatus {}
class NewsGetSearchErrorState extends NewsStatus {
  final String err;
  NewsGetSearchErrorState(this.err);
}