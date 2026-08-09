var alvo = instance_nearest(x, y, obj_player);

if (alvo != noone)
{
    if (point_distance(x, y, alvo.x, alvo.y) <= 68)
        estado = EnemyState.PERSEGUIR;
    else
        estado = EnemyState.RONDA;
}
else
{
    estado = EnemyState.RONDA;
}


// Detecta player
if (instance_exists(obj_player))
{
    if (point_distance(x, y, obj_player.x, obj_player.y) <= 68)
        estado = EnemyState.PERSEGUIR;
    else
        estado = EnemyState.RONDA;
}
if (!place_meeting(x + direcao * 8, y + 1, obj_chao))
{
    direcao *= -1;
}
switch (estado)
{
    //////////////////////////////////////////////////
    // RONDA
    //////////////////////////////////////////////////

    case EnemyState.RONDA:

        sprite_index = spr_enemy_walk;

        velh = direcao;

        if (x >= x_inicial + dist_ronda)
            direcao = -1;

        if (x <= x_inicial - dist_ronda)
            direcao = 1;

    break;

    //////////////////////////////////////////////////
    // PERSEGUIR
    //////////////////////////////////////////////////

    case EnemyState.PERSEGUIR:

        sprite_index = spr_enemy_run;

        velh = sign(obj_player.x - x) * max_velh;

    break;
}

velv += gravidade;
velv = clamp(velv,-max_velv,max_velv);

repeat(abs(velh))
{
    var h = sign(velh);

    if(place_meeting(x+h,y,obj_chao))
    {
        velh = 0;
        break;
    }

    x += h;
}

repeat(abs(velv))
{
    var v = sign(velv);

    if(place_meeting(x,y+v,obj_chao))
    {
        velv = 0;
        break;
    }

    y += v;
}

if (velh != 0)
    image_xscale = sign(velh);
	
	