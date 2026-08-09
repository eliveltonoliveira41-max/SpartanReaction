if (place_meeting(x + sign(velh), y, obj_box))
{
    var pedra = instance_place(x + sign(velh), y, obj_box);

    pedra.velh += velh * 0.05;

    // o jogador perde velocidade
    velh *= 0.65;
}

