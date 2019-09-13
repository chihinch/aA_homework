const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


// function teaAndBiscuits () {
//   reader.question('Would you like some tea?', (res) => {
//     first = res;
//     console.log(`You said ${res} to tea.`);
//   });
//   reader.close();
// }

// teaAndBiscuits();

function teaAndBiscuits(callback) {
  let first, second;

  reader.question('Would you like some tea? ', (teaRes) => {
    first = teaRes;
    console.log(`You replied ${teaRes}.`);
    
    reader.question('Would you like some biscuits? ', (biscuitRes) => {
      second = biscuitRes;
      // console.log(`You replied ${biscuitRes}.`);
      callback(firstRes, secondRes);
    });
  });
  
  const firstRes = (first === 'yes') ? 'do' : 'don\'t';
  const secondRes = (second === 'yes') ? 'do' : 'don\'t';
}

teaAndBiscuits( (firstRes, secondRes) => {
  console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
  reader.close();
});