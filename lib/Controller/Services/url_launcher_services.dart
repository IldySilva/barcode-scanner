import 'package:prouserchallenge/View/components/snackbars.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class URLauncher{

  void launchUrl(urlToLaunch)async {
    urlToLaunch=Uri.parse(urlToLaunch);
    if(await launcher.canLaunchUrl(urlToLaunch)) {
      launcher.launchUrl(  urlToLaunch);
    }
    else{
      UiResponses().showFailedMessage("Nao foi possivel Acessar URL");
    }
  }
}