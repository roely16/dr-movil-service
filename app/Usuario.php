<?php 

	namespace App;
 
	use Illuminate\Database\Eloquent\Model;
 
	class Usuario extends Model{
		
		protected $table = 'usuario';

		protected $fillable = ['nombres', 'apellidos', 'email', 'telefono', 'password', 'rol_id', 'clinica_id', 'servicio_salud_id'];

		protected $hidden = ['password', 'telefono', 'created_at', 'updated_at', 'deleted_at'];

	}

?>