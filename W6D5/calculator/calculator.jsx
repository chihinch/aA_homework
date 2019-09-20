import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = { result: 0, num1: "", num2: "" }
    this.setNum1 = this.setNum1.bind(this); // preserve scope of 'this' by binding these functions
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  //your code here

  render(){
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} value={this.state.num1}/>
        <input onChange={this.setNum2} value={this.state.num2}/>
        <button onClick={this.clear}>Clear</button>
        <br/>
        <button onClick={this.add}>Add</button>
        <button onClick={this.subtract}>Subtract</button>
        <button onClick={this.multiply}>Multiply</button>
        <button onClick={this.divide}>Divide</button>
      </div>
    );
  }

  // Input fields: change value of state
  // I have to use parseInt so that the mathematical operations actually work, and don't
  // concatenate strings
  setNum1(e) {
    this.setState({num1: parseInt(e.currentTarget.value, 10)});
  }
  setNum2(e) {
    this.setState({num2: parseInt(e.currentTarget.value, 10)});
  }

  // Arithmetic functions
  add(e) {
    e.preventDefault();
    const sum = this.state.num1 + this.state.num2;
    this.setState({result: sum});
  }
  subtract(e) {
    e.preventDefault();
    const difference = this.state.num1 - this.state.num2;
    this.setState({ result: difference });
  }
  multiply(e) {
    e.preventDefault();
    const product = this.state.num1 * this.state.num2;
    this.setState({ result: product });
  }
  divide(e) {
    e.preventDefault();
    const quotient = this.state.num1 / this.state.num2;
    this.setState({ result: quotient });
  }

  // clear inputs - reset state of num1, num2 to empty str
  clear(e) {
    this.setState({ num1: "", num2: "" });
  }
}

export default Calculator;
