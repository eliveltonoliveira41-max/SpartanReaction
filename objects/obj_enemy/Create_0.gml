// Estados
estado = 0;

enum EnemyState
{
    RONDA,
    PERSEGUIR
}

// Movimento
velh = 0;
velv = 0;

gravidade = 0.35;
max_velh = 1.2;
max_velv = 8;

// Ronda
x_inicial = x;
dist_ronda = 32;
direcao = 1;

// Sprite
sprite_atual = spr_enemy_walk;
sprite_index = sprite_atual;