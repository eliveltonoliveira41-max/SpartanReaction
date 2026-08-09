if (mostrando)
{
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    var margem = 12;

    var x1 = 10;
    var y1 = gui_h - 75;

    var x2 = gui_w - 10;
    var y2 = gui_h - 10;


    // Fundo preto
    draw_set_color(c_black);
    draw_rectangle(x1, y1, x2, y2, false);


    // Borda branca
    draw_set_color(c_white);
    draw_rectangle(x1, y1, x2, y2, true);


    // Texto
    draw_set_font(fnt_msg);
draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    var espacamento_linha = 18;

draw_text_ext
(
    x1 + margem,
    y1 + margem,
    mensagem,
    espacamento_linha,
    x2 - x1 - margem * 2
);
    


    // Indicação
    draw_set_halign(fa_right);
    draw_set_valign(fa_bottom);

    draw_text(
        x2 - margem,
        y2 - margem,
        "ENTER"
    );
}