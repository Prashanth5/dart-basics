//https://blog.logrocket.com/multithreading-flutter-using-dart-isolates/
//https://blog.codemagic.io/understanding-flutter-isolates/

import 'dart:developer';
import 'dart:isolate';

void main() {
  Isolate.spawn<IsolateModel>(heavyTask, IsolateModel(355000, 500));
}

void heavyTask(IsolateModel model) {
  int total = 0;

  /// Performs an iteration of the specified count
  for (int i = 1; i < model.iteration; i++) {
    /// Multiplies each index by the multiplier and computes the total
    total += (i * model.multiplier);
  }

  print("FINAL TOTAL: $total");
}

class IsolateModel {
  IsolateModel(this.iteration, this.multiplier);

  final int iteration;
  final int multiplier;
}
