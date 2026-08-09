if (!instance_exists(obj_player))
{
    exit;
}

var alvo = obj_player;

// Posição da câmera
var cam_x = clamp(alvo.x - 160, 0, room_width - 640);
var cam_y = clamp(alvo.y - 90, 0, room_height - 280);

// Shake
var off_x = 0;
var off_y = 0;

if (shake > 0)
{
    shake--;

    off_x = random_range(-shake_force, shake_force);
    off_y = random_range(-shake_force, shake_force);

    shake_force *= 0.85;
}

camera_set_view_pos(cam, cam_x + off_x, cam_y + off_y);