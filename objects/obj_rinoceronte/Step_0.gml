// =====================================================
// GRAVIDADE
// =====================================================

velv += 0.5;

if (velv > 8)
    velv = 8;


// Movimento vertical
if (!place_meeting(x, y + velv, obj_chao))
{
    y += velv;
}
else
{
    while (!place_meeting(x, y + sign(velv), obj_chao))
    {
        y += sign(velv);
    }

    velv = 0;
}


// =====================================================
// RINO PRESO NA JAULA
// =====================================================

if (estado == "preso")
{
    velh = 0;

    if (!place_meeting(x, y, obj_jaula))
    {
        estado = "solto";
        sprite_index = spr_rinowalk;
    }
}


// =====================================================
// RINO SOLTO
// =====================================================

if (estado == "solto")
{
    var alvo = noone;
    var seguindo_player = false;


    // =================================================
    // PROCURA INIMIGO MAIS PRÓXIMO
    // =================================================

    var inimigo = instance_nearest(x, y, obj_enemy);

    if (inimigo != noone)
    {
        if (point_distance(x, y, inimigo.x, inimigo.y) <= 180)
        {
            alvo = inimigo;
        }
    }


    // =================================================
    // SE NÃO TIVER INIMIGO PERTO, SEGUE O PLAYER
    // =================================================

    if (alvo == noone)
    {
        if (instance_exists(obj_player))
        {
            alvo = obj_player;
            seguindo_player = true;
        }
    }


    // =================================================
    // PERSEGUIR ALVO
    // =================================================

    if (alvo != noone)
    {
        var distancia_x = alvo.x - x;

        if (abs(distancia_x) > 4)
        {
            var direcao = sign(distancia_x);


            // =========================================
            // SE ESTÁ SEGUINDO O PLAYER
            // =========================================

            if (seguindo_player)
            {
                // Distância de segurança da borda
                var distancia_borda = 32;

                // Verifica se ainda existe chão
                // alguns pixels à frente
                var tem_chao_a_frente = place_meeting(
                    x + direcao * distancia_borda,
                    y + 4,
                    obj_chao
                );


                // -------------------------------------
                // NÃO TEM CHÃO À FRENTE
                // PARA ANTES DA BORDA
                // -------------------------------------

                if (!tem_chao_a_frente)
                {
                    velh = 0;
                }
                else
                {
                    // Verifica obstáculo na frente
                    if (!place_meeting(
                        x + direcao * velocidade,
                        y,
                        obj_chao
                    ))
                    {
                        velh = direcao * velocidade;

                        // Sprite original olha para ESQUERDA
                        if (direcao < 0)
                        {
                            image_xscale = 1;
                        }
                        else
                        {
                            image_xscale = -1;
                        }
                    }
                    else
                    {
                        velh = 0;
                    }
                }
            }


            // =========================================
            // SE ESTÁ PERSEGUINDO INIMIGO
            // =========================================

            else
            {
                if (!place_meeting(
                    x + direcao * velocidade,
                    y,
                    obj_chao
                ))
                {
                    velh = direcao * velocidade;

                    // Sprite original olha para ESQUERDA
                    if (direcao < 0)
                    {
                        image_xscale = 1;
                    }
                    else
                    {
                        image_xscale = -1;
                    }
                }
                else
                {
                    velh = 0;
                }
            }
        }
        else
        {
            velh = 0;
        }
    }
    else
    {
        velh = 0;
    }


    // =================================================
    // MOVIMENTO HORIZONTAL
    // =================================================

    x += velh;
}