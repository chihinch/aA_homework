const madLib = (verb, adjective, noun) => {
  console.log(`We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`)
};

madLib('make', 'best', 'guac');

const isSubstring = (searchString, subString) => {
  console.log(searchString.includes(subString))
};

isSubstring("time to program", "time");
isSubstring("Jump for joy", "joys");

function fizzBuzz(array) {
  const fizzBuzzArr = [];

  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      fizzBuzzArr.push(el)
    }
  });

  console.log(`${fizzBuzzArr}`);
}

fizzBuzz([3, 5, 8, 10, 15, 18])

function isPrime(number) {
  if (number < 2) {
    return false;
  }

  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }

  return true;
}

console.log(isPrime(15))
console.log(isPrime(7))

function sumOfNPrimes(n) {
  let sum = 0;
  let countPrimes = 0;
  let i = 2;

  while (countPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      countPrimes++;
    }
    i++
  }
  return sum;
}

console.log(sumOfNPrimes(10)) // 129 according to google

// titleize takes a names array and a callback function
// map the names to their titleized form with a Fat Arrow function
// invoke callback passing in the titleized array

function titleize(names, callback) {
  let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(titleized);
}

// test out the titleize function passing in an array of names and an anonymous function as the callback

titleize(["Hydrogen", "Helium", "Lithium"], (names) => {
  names.forEach(name => console.log(name));
} );

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function () {
  this.height = this.height + 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function () {
  trickIndex = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
};

const babar = new Elephant("Babar", 76, ["balancing a ball", "dancing", "riding a bicycle"]);
babar.trumpet();
console.log(babar.height);
babar.grow();
console.log(babar.height);
babar.addTrick("sleeping");
babar.play();


