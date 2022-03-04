Future<void> delaySeconds(int sec) async {
  await Future.delayed(Duration(seconds: sec));
}
