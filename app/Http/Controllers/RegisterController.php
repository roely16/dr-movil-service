<?php 

	namespace App\Http\Controllers;

	use Illuminate\Http\Request;

	use App\Clinica;
	use App\Rol;
	use App\Usuario;

	class RegisterController extends Controller{

		public function get_data(){

			try {
				
				$clinicas = Clinica::all();

				$roles = Rol::all();

				$response  = [
					"clinicas" => $clinicas,
					"roles" => $roles
				];

				return response()->json($response);

			} catch (\Throwable $th) {
				
				return response()->json($th->getMessage());
				
			}

		}

		public function register(Request $request){

			$usuario = Usuario::create($request->all());

			return response()->json($request);

		}

	}

?>