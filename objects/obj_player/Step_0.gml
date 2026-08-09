//APLICANDO O MOVIMENTO
 
var _up    = keyboard_check(ord("W"));
var _left  = keyboard_check(ord("A"));
var _down  = keyboard_check(ord("S"));
var _right = keyboard_check(ord("D"));
var _jump  = keyboard_check_pressed(vk_space);
var _chao = place_meeting(x, y + 1, obj_chao)
          || place_meeting(x, y + 1, obj_plataforma);
 
 
if (keyboard_check_pressed(ord("R")))
{
    audio_stop_all();
    room_restart();    
}

if (keyboard_check_pressed(vk_escape))
{
    game_end();     
}


if (velh != 0)
{
    if (floor(image_index) == 1 || floor(image_index) == 3)
    {
        if (!passo_tocado)
        {
            audio_play_sound(snd_passo, 1, false);
            passo_tocado = true;
        }
    }
    else
    {
        passo_tocado = false;
    }
}
else
{
    passo_tocado = false;
}
 
 
//APLICANDO OS MOVIMENTOS

velh = (_right - _left) * max_velh;

velv += gravidade;

//LIMITANDO A GRAVIDADE

velv = clamp(velv, -max_velv, max_velv);

//PULANDO 

if (_jump && max_jump > 0)
{
    audio_play_sound(snd_pulo,1,false);
    velv = -max_velv;    
    max_jump -= 1;
}

if (_chao)
{
    max_jump = 1;
}


if (keyboard_check(ord("D")))
{
    image_xscale = 1;
}

if (keyboard_check(ord("A")))
{
    image_xscale = -1;
}


if (place_meeting(x + sign(velh), y, obj_pedrap))
{
    var pedra = instance_place(x + sign(velh), y, obj_pedrap);

    pedra.velh += velh * 0.2;
}


////////CAIXA////////////////
////////////////////////

var caixa = instance_place(x + sign(velh), y, obj_box);

if (caixa != noone)
{
    caixa.velh = velh;
}