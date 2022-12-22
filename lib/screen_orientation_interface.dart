abstract class ScreenOrientationService {
  //方向回调
  late Function orientationCallback;

  void setOrientationCallback(Function orientationCallback) {
    this.orientationCallback = orientationCallback;
  }

  Future<void> init();
}
