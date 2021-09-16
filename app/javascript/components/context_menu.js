function contextMenu(){
let menu = null;
document.addEventListener('DOMContentLoaded', function(){
    //make sure the right click menu is hidden
  menu = document.querySelector('.menu');
  menu.classList.add('off');

  //add the right click listener to the box
  let box = document.getElementById('dropdown');
  box.addEventListener('contextmenu', showmenu);

  //add a listener for leaving the menu and hiding it
  menu.addEventListener('mouseleave', hidemenu);

  //add the listeners for the menu items
  addMenuListeners();
});


function addMenuListeners(){
  document.getElementById('delete').addEventListener('click', remove);
  document.getElementById('gold').addEventListener('click', setColour);
  document.getElementById('green').addEventListener('click', setColour);
}

function showmenu(ev){
  //stop the real right click menu
  ev.preventDefault();
  //show the custom menu
  console.log( ev.clientX, ev.clientY );
  menu.style.top = `${ev.clientY - 20}px`;
  menu.style.left = `${ev.clientX - 20}px`;
  menu.classList.remove('off');
}


function remove(ev){
  hidemenu();
  let clr = ev.target.id;
  document.getElementById('dropdown').style.backgroundColor = clr;
}

}

export {contextMenu };
