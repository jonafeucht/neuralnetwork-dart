import 'dart:math';

import 'neural.dart';

final rng = new Random();

List<double> initializeWeights(int n) {
  return [for (var i = 0; i < n; i++) rng.nextDouble()];
}

void main() {
  var inputLayer = new Layer([
    new Neuron(initializeWeights(2), rng.nextDouble(), relu),
    new Neuron(initializeWeights(2), rng.nextDouble(), relu),
  ]);

  var hiddenLayer = new Layer([
    new Neuron(initializeWeights(2), rng.nextDouble(), relu),
    new Neuron(initializeWeights(2), rng.nextDouble(), relu),
    new Neuron(initializeWeights(2), rng.nextDouble(), relu),
  ]);

  var outputLayer = new Layer([
    new Neuron(initializeWeights(3), rng.nextDouble(), sigmoid),
  ]);

  var network = new Network([inputLayer, hiddenLayer, outputLayer]);

  var inputs = [1.0, 2.0];
  var outputs = network.forward(inputs);
  print(outputs);
}
