$(document).ready( function() {
  createPlayers();

  $(document).on('keyup', function(e) {
    if (e.keyCode == 75) {
      player2.position += 1;
    }
    if (e.keyCode == 83) {
      player1.position += 1;
    }

    winning();
    updatePlayerPositions();
  });
});

function createPlayers() {
  player1 = new Player;
  player2 = new Player;
}

function updatePlayerPositions() {
  $('.racer_table tr').children().removeClass('active');
  $("#player1_strip td:nth-child(" + player1.position + ")").addClass('active');
  $("#player2_strip td:nth-child(" + player2.position + ")").addClass('active');
}

function winning() {
  if(player1.position == 21) {
    // return player1 to Ajax
    $.ajax({
      type: "POST",
      url: "/games/new",
      data: { the_winner: "player_one"},
      success: function(response) {
        // console.log(response);
        window.location.replace('/');
      }
    });

  }
  if(player2.position == 21) {
    $.ajax({
      type: "POST",
      url: "/games/new",
      data: { the_winner: "player_two" }
    });
  }
}

// .ajax {
//   action "POST"
//   URL "/"
//   data {winner: player1.name } <----passes this hash as 'params'
// }.done(msg){slkdglsdrghjl}
