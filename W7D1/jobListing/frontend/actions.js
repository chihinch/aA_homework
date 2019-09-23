// export const SWITCH_LOCATION = "SWITCH_LOCATION";

export const selectLocation = (city, jobs) => {
  return {
    type: "SWITCH_LOCATION",
    city,
    jobs,
  };
};