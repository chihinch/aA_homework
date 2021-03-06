// import SWITCH_LOCATION from "./actions";

const initialState = {
  city: "Please Select", 
  jobs: []
};

const reducer = (state = initialState, action) => {
  Object.freeze(state); // safety net to ensure state is not accidentally mutated
  switch (action.type) {
    case "SWITCH_LOCATION":
      // let nextState = Object.assign({}, state);
      // nextState.city = action.city;
      // nextState.jobs = action.jobs;
      // return nextState;
      return {
        city: action.city,
        jobs: action.jobs,
      };
    default:
      return state;
  }
};

export default reducer;
