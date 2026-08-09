repeat(abs(velh))
{
    var dir = sign(velh);

    // Se há parede, tenta descer 1 pixel antes
    if (place_meeting(x + dir, y, obj_chao))
    {
       
        {
            velh = 0;
            break;
        }
    }

    // Move
    x += dir;

    // Procura o chão até 4 pixels abaixo
    var caiu = false;

    for (var i = 1; i <= 4; i++)
    {
        if (place_meeting(x, y + i, obj_chao))
        {
            y += i - 1;
            caiu = true;
            break;
        }
    }

    // Não encontrou chão? Cai normalmente
    if (!caiu)
    {
        break;
    }
}

velv += grav;

repeat(abs(velv))
{
    var dir = sign(velv);

    if (!place_meeting(x, y + dir, obj_chao))
    {
        y += dir;
    }
    else
    {
        velv = 0;
        break;
    }
}

