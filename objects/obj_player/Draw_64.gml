var startX = 10;
var startY = 10;
var xSpacing = 40;
var ySpacing = 40;
var quantityOffsetX = 26;  // Adjust as needed for bottom right
var quantityOffsetY = 10;  // Adjust as needed for bottom right
var fontSize = 1.8;        // Adjust as needed for text size

for (var i = 0; i < array_length(global.player_inventory); i++) {
    // Draw the sprite
    draw_sprite(global.player_inventory[i].sprite, 1, startX, startY);

    // Draw the quantity
    draw_text_transformed(startX + quantityOffsetX, startY + quantityOffsetY, string(global.player_inventory[i].qty),
                          fontSize, fontSize, 0);  // 0 rotation

    startX += xSpacing;

    if (startX > 250) {
        startX = 10;
        startY += ySpacing;
    }
}
