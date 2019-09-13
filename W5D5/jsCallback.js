// Simple Timeout

const setTimeout = () => {
  window.setTimeout(() => alert('HAMMERTIME'), 5000);
}

// hammerTime

const hammerTime = (time) => {
  window.setTimeout(() => alert(`${time} is hammertime!`), time);
}