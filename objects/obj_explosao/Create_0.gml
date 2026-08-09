sprite_index = spr_explosao;
image_speed = 1.5;
var raio = 50;
var forca = 10;

with (obj_pedrap)
{
    var dist = point_distance(x, y, other.x, other.y);

    if (dist <= raio)
    {
        var dir = point_direction(other.x, other.y, x, y);

        velh += lengthdir_x(forca, dir);
        velv += lengthdir_y(forca, dir);
    }
}

audio_play_sound(snd_boom, 1, false);