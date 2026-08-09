
if (!quebrada)
{
    quebrada = true;

   
}
    instance_create_layer(x, y, "Instances", obj_boxexplod);
	with (obj_camera)
{
    shake = 12;
    shake_force = 25;
}
    instance_destroy();
	
	
