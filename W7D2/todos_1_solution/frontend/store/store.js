import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import { applyMiddleware } from 'redux';

// PHASE 3: Redux
// Moved the middleware function from Phase 2 to this file
const addLoggingToDispatch = (store) => (next) => (action) => {
  console.log(store.getState());
  console.log(action);
  let result = next(action);
  console.log(store.getState());
  return result;
};

const configureStore = (preloadedState = {}) => {
  // Add call to applyMiddleware, passing in the middleware, to arguments of createStore
  const store = createStore(rootReducer, preloadedState, applyMiddleware(addLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}


export default configureStore;
