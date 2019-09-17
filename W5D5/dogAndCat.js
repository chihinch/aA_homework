function Cat() {
  this.name = 'Markov';
  this.age = 3;
}

function Dog() {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat();
const Noodles = new Dog();

Noodles.chase(Markov);

Noodles.chase.call(Markov, Noodles); // two arguments, this = Markov, cat = Noodles (despite Noodles being a dog?)
Noodles.chase.apply(Markov, [Noodles]); // two arguments, this = Markov, [Noodles] represents array of arguments being passed to chase function