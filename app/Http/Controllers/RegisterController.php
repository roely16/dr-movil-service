<?php 

	namespace App\Http\Controllers;

	use Illuminate\Http\Request;

	use App\Clinica;
	use App\Rol;
	use App\Usuario;

	use App\Jobs\SendMail;

	use Illuminate\Support\Facades\Hash;

	class RegisterController extends Controller{

		public function get_data(){

			try {
				
				$clinicas = Clinica::all();

				$roles = Rol::all();

				$response  = [
					"clinicas" => $clinicas,
					"roles" => $roles
				];

				return response()->json($response, 200);

			} catch (\Throwable $th) {
				
				return response()->json([
					'type' => 'error',
					'message' => $th->getMessage()
				], 400);
				
			}

		}

		public function register(Request $request){

			try {

				// Check if user already exists

				$exist_user = Usuario::where('email', $request->email)->first();

				if ($exist_user) {
					
					$response = [
						"type" => "info",
						"message" => "Ya existe un usuario registrado con el mismo correo electrónico."
					];

					return response()->json($response, 400);

				}

				$request->offsetSet('password', Hash::make($request->password));

				$usuario = Usuario::create($request->all());

				$response = [
					"type" => "success",
					"message" => "Usuario registrado exitosamente.  Se ha envidado un correo electrónico con instrucciones para la activación de la cuenta.",
					"data" => $usuario
				];

				// Send mail
				dispatch(new SendMail);

				return response()->json($response, 200);

			} catch (\Throwable $th) {
				
				return response()->json([
					'type' => 'error',
					'message' => $th->getMessage()
				], 400);

			}			

		}

	}

?>