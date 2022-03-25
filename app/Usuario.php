<?php 

	namespace App;
 
	use Illuminate\Database\Eloquent\Model;
 
	class Usuario extends Model{
		
		protected $table = 'usuario';

		protected $fillable = ['nombres', 'apellidos', 'email', 'telefono', 'password', 'rol_id', 'clinica_id'];

		protected $encryption = ['password'];

	}

?>