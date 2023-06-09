abstract class AppState{}
class AppInitialState extends AppState{}


class ChangeLunApp extends AppState{}
class ChangeImageState extends AppState{}
class ChangeIndexState extends AppState{}

class LoadingGetItemHome extends AppState{}
class SuccessGetItemHome extends AppState{
  int?lendth;
  SuccessGetItemHome(this.lendth);
}
class ErrorGetItemHome extends AppState{}

class LoadingGetCategory extends AppState{}
class SuccessGetCategory extends AppState{}
class ErrorGetCategory extends AppState{}

class LoadingGetSubCategory extends AppState{}
class SuccessGetSubCategory extends AppState{}
class ErrorGetSubCategory extends AppState{}

class LoadingGetCountries extends AppState{}
class SuccessGetCountries extends AppState{}
class ErrorGetCountries extends AppState{}

class LoadingGetCities extends AppState{}
class SuccessGetCities extends AppState{}
class ErrorGetCities extends AppState{}

class LoadingFormSearch extends AppState{}
class SuccessFormSearch  extends AppState{}
class ErrorFormSearch  extends AppState{}

class LoadingFormNotSearch extends AppState{}
class SuccessFormNotSearch  extends AppState{}
class ErrorFormNotSearch  extends AppState{}

class LoadingGetContactUs extends AppState{}
class SuccessGetContactUs extends AppState{}
class ErrorGetContactUs extends AppState{}

class LoadingGetOurVision extends AppState{}
class SuccessGetOurVision extends AppState{}
class ErrorGetOurVision extends AppState{}

class LoadingOtp extends AppState{}
class SuccessOtp  extends AppState{
  String type;
  SuccessOtp(this.type);
}
class ErrorOtp  extends AppState{}

class LoadingReSend extends AppState{}
class SuccessReSend  extends AppState{}
class ErrorReSend extends AppState{}



class LoadingTallFriend extends AppState{}
class SuccessTallFriend  extends AppState{}
class ErrorTallFriend extends AppState{}

class LoadingFormDontion extends AppState{}
class SuccessFormDontion extends AppState{
  String msg;
  String userID;
  SuccessFormDontion(this.msg,this.userID);
}
class ErrorFormDontion extends AppState{}