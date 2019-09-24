import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';


// PHASE 1: addLoggingToDispatch
// const addLoggingToDispatch = (store) => {
//   const dispatch = store.dispatch;
//   return (action) => {
//     console.log(store.getState()); // log the old state
//     console.log(action); // log the action
//     dispatch(action); // call dispatch, passing it the action
//     console.log(store.getState()); // log the new state
//   };
// };

// PHASE 2: Refactor to middleware
const addLoggingToDispatch = (store) => (next) => (action) => {
  console.log(store.getState());
  console.log(action);
  let result = next(action);
  console.log(store.getState());
  return result;
};

const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch });
};

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  
  store = applyMiddlewares(store, addLoggingToDispatch);
  // store.dispatch = addLoggingToDispatch(store);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
