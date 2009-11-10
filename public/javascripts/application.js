
function show_stars(star_nr) {
  for( i = 0; i <= star_nr; i++) {
    $('star'+i).addClassName('over');
  }
}

function hide_stars(star_nr) {
  for( i = star_nr; i >= 0 ; i--) {
    $('star'+i).removeClassName('over');
  }
}