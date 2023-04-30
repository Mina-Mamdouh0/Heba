abstract class AppState{}
class AppInitialState extends AppState{}


class ChangeLunApp extends AppState{}

class LoadingGetItemHome extends AppState{}
class SuccessGetItemHome extends AppState{
  int?lendth;
  SuccessGetItemHome(this.lendth);
}
class ErrorGetItemHome extends AppState{}

class LoadingGetCategory extends AppState{}
class SuccessGetCategory extends AppState{}
class ErrorGetCategory extends AppState{}

class LoadingGetCountries extends AppState{}
class SuccessGetCountries extends AppState{}
class ErrorGetCountries extends AppState{}

class LoadingGetCities extends AppState{}
class SuccessGetCities extends AppState{}
class ErrorGetCities extends AppState{}

class LoadingGetContactUs extends AppState{}
class SuccessGetContactUs extends AppState{}
class ErrorGetContactUs extends AppState{}

class LoadingGetOurVision extends AppState{}
class SuccessGetOurVision extends AppState{}
class ErrorGetOurVision extends AppState{}