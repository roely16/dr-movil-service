<?php 

	namespace App\Http\Controllers;

	use Illuminate\Http\Request;

	use App\Clinica;
	use App\Rol;
	use App\Usuario;
	use App\Tipo_Usuario;
	use App\Servicio_Salud;

	use App\Jobs\SendMail;

	use Illuminate\Support\Facades\Hash;

	class RegisterController extends Controller{

		public function get_data(Request $request){

			try {
				
				$clinicas = Clinica::all();

				$roles = Rol::where('tipo_usuario_id', $request->tipo_usuario_id)->get();

				$servicios_salud = Servicio_Salud::where('tipo_usuario_id', $request->tipo_usuario_id)->get();

				$response  = [
					"clinicas" => $clinicas,
					"roles" => $roles,
					"servicios_salud" => $servicios_salud
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
					// "message" => "Usuario registrado exitosamente.  Se ha envidado un correo electrónico con instrucciones para la activación de la cuenta.",
					"message" => "El usuario ha sido registrado exitosamente",
					"data" => $usuario
				];

				// Send mail
				//dispatch(new SendMail);

				return response()->json($response, 200);

			} catch (\Throwable $th) {
				
				return response()->json([
					'type' => 'error',
					'message' => $th->getMessage()
				], 400);

			}			

		}

		public function get_types_user(){

			try {
				
				$types_user = Tipo_Usuario::all();

				foreach ($types_user as &$type) {
					
					$type->select = false;

				}

				return response()->json($types_user);

			} catch (\Throwable $th) {
				
				return response()->json([
					'type' => 'error',
					'message' => $th->getMessage()
				], 400);

			}

		}

	}

?>