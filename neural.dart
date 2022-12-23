import 'dart:math';

class Network {
  List<Layer> layers;

  Network(this.layers);

  List<double> forward(List<double> inputs) {
    var current = inputs;
    for (var i in layers) {
      current = i.forward(current);
    }
    return current;
  }
}

class Layer {
  List<Neuron> neurons;
  Layer(this.neurons);

  List<double> forward(List<double> inputs) {
    return [for (var i in neurons) i.forward(inputs)];
  }
}

class Neuron {
  List<double> weights;
  double bias;
  ActivationFunction activationFunction;

  Neuron(this.weights, this.bias, this.activationFunction);

  double forward(List<double> inputs) {
    assert(inputs.length == weights.length);

    var result = 0.0;

    for (var i = 0; i < inputs.length; i++) {
      result += inputs[i] * weights[i];
    }
    result += bias;

    result = activationFunction(result);

    return result;
  }
}

typedef double ActivationFunction(double x);

ActivationFunction sigmoid = (double x) => 1 / (1 + exp(-x));
ActivationFunction tanh = (double x) => 2 / (1 + exp(-2 * x)) - 1;
ActivationFunction relu = (double x) => max(0, x);
