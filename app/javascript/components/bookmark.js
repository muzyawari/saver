
const bookmark = (query) => {
fetch()
  .then(response => response.json())
  .then((response) => {
    console.log(response);

    document.getElementById("mytitle").innerHTML = response.title
    document.getElementById("mydescription").innerHTML = response.description
    document.getElementById("myimage").src = response.image

  });

      // document.getElementById("results").innerHTML = data.image;
  };



export{bookmark}
