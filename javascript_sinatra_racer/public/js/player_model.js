function Player() {
  this.position = 1;
};

Player.prototype = {
  update_position: function(positions) {
    this.position += positions;
  }
};