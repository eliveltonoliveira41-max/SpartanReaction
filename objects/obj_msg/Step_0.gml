if (mostrando)
{
    // Mantém o player parado
    obj_player.hsp = 0;
    obj_player.vsp = 0;

    // Fecha a mensagem
    if (keyboard_check_pressed(vk_enter) ||
        keyboard_check_pressed(vk_space))
    {
        mostrando = false;
    }
}