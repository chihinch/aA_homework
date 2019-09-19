document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  // --- your code here!
  const placesFormEl = document.getElementsByClassName("list-container");
  // debugger
  placesFormEl[0].addEventListener("submit", event => {
    event.preventDefault();
    const newPlaceEl = document.getElementsByClassName("favorite-input");
    const newPlace = newPlaceEl[0].value;
    newPlaceEl[0].value = "";

    const placesUl = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = newPlace;
    placesUl.append(li);
  });



  // adding new photos
  // --- your code here!
  const photoShowButton = document.getElementsByClassName("photo-show-button")[0];
  photoShowButton.addEventListener("click", event => {
    const photoFormEl = document.getElementsByClassName("photo-form-container")[0];
    photoFormEl.classList.toggle("hidden");
  });
  
  const photoFormEl = document.getElementsByClassName("photo-form-container")[0];
  photoFormEl.addEventListener("submit", event => {
    event.preventDefault();
    const newPhotoEl = document.getElementsByClassName("photo-url-input")[0];
    const newPhotoURL = newPhotoEl.value;
    newPhotoEl.value = "image URL";

    const li = document.createElement("li");
    const img = document.createElement("img");
    img.textContent = newPhotoURL;
    li.append(img);

    const dogPhotosUl = document.getElementsByClassName("dog-photos")[0];
    dogPhotosUl.append(li);
  });

  // debugger



});
