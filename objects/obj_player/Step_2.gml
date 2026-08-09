  //////////MOVIMENTO E COLISÃO HORIZONTAL//////////
 //////////////////////////////////////////////////


repeat (abs(velh))
{
	var _velh = sign(velh);
	
		//SUBINDO A RAMPA
	
if (place_meeting(x +_velh, y, obj_chao)) && 
	!place_meeting(x+_velh , y-1 ,obj_chao)
{
	//SUBINDO 1 PIXEL
	y--
}

 //DESCENDO A ROUPA
 
 if (!place_meeting(x + _velh, y , obj_chao) &&
     !place_meeting(x + _velh, y + 1 , obj_chao)) &&
	  place_meeting(x + _velh, y + 2 , obj_chao)
	  
	  {
		y++  
	  }
///CHECANDO SE VOU BATER NA PAREDE
if (place_meeting(x + _velh, y, obj_chao))
{
    velh = 0
    break;
}

//CHECANDO SE VOU ENTRAR NA CAIXA
if (place_meeting(x + _velh, y, obj_box) &&
    !place_meeting(x, y + 1, obj_box))
{
    velh = 0;
    break;
}
	
	else 
	{
		x+= _velh	
	}
		
	
}


  //////////MOVIMENTO E COLISÃO VERTICAL//////////
 /////////////////////////////////////////////////

 //APLICANDO OS MOVIMENTOS

velv += gravidade

repeat (abs(velv))
{
	var _velv = sign(velv);

	
//CHECANDO SE VOU BATER NA PAREDE	
	if (place_meeting(x, y + _velv, obj_chao) ||
	    place_meeting(x, y + _velv, obj_box))
	{
//VOU PARAR	
		velv = 0
		break;
	}
	
	else 
	{
		y+= _velv	
	}
		
	
}

/////////////ALTERANDO E VIRANDO O SPRITE//////////////////
//////////////////////////////////////////////////////////

var novo_sprite = spr_player;

// No ar
if (!place_meeting(x, y + 1, obj_chao) &&
    !place_meeting(x, y + 1, obj_box))
{
    if (velv < 0)
        novo_sprite = spr_player;
    else
        novo_sprite = spr_player_run;
}
// No chão
else if (velh != 0)
{
    novo_sprite = spr_player_run;
}

// Só troca se for diferente
if (sprite_atual != novo_sprite)
{
    sprite_atual = novo_sprite;
    sprite_index = sprite_atual;
    image_index = 0;
}