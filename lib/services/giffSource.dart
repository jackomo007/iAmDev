import 'networking.dart';

const apiKey = 'nWAsMr2D7sx2MpWPXhtHYhSQ4MxeFVRb';
const apiURL = 'https://api.giphy.com/v1/gifs/random?tag=programmer';

class GiffModel {
  Future<dynamic> getGiff() async {
    NetworkHelper networkHelper = NetworkHelper('$apiURL&api_key=$apiKey');
    var giffData = await networkHelper.getData();
    return giffData;
  }
}
