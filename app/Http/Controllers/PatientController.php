<?php 

	namespace App\Http\Controllers;

	use Illuminate\Http\Request;

	use App\Ficha_Paciente;
	use App\Rol_Ficha_Paciente;
	use App\Servicio_Salud;
	use App\Paciente;

	use Illuminate\Support\Facades\DB;
	
	class PatientController extends Controller{

		public function get_patients(){

			try {
				
				$headers = [
					[
						"text" => "Paciente",
						"value" => "nombre",
						"align" => "start",
						"sortable" => false,
						"width" => "50%"
					],
					[
						"text" => "Edad",
						"value" => "edad",
						"align" => "center",
						"sortable" => false,
						"width" => "10%"
					],
					[
						"text" => "Sexo",
						"value" => "sexo",
						"align" => "center",
						"sortable" => false,
						"width" => "10%"
					],
					[
						"text" => "Emergencia",
						"value" => "emergencia",
						"align" => "start",
						"sortable" => false,
						"width" => "10%"
					],
					[
						"text" => "Consulta Externa",
						"value" => "consulta_externa",
						"align" => "start",
						"sortable" => false,
						"width" => "10%"
					],
					[
						"text" => "Acciones",
						"value" => "acciones",
						"align" => "right",
						"sortable" => false,
						"width" => "10%"
					]
				];

				$items = Paciente::all();

				$response = [
					"headers" => $headers,
					"items" => $items
				];

				return response()->json($response);
			
			} catch (\Throwable $th) {
				
				return response()->json($th->getMessage());

			}
			

		}

		public function get_tabs_form(Request $request){

			try {
				
				// Get tabs

				$tabs_ficha = Ficha_Paciente::whereIn('id', 
					Rol_Ficha_Paciente::select('ficha_paciente_id')->where('rol_id', $request->rol_id)->get()->toArray()
				)->get();

				// Get health services
				$health_services = Servicio_Salud::all();

				$response = [
					"tabs" => $tabs_ficha,
					"health_services" => $health_services
				];

				return response()->json($response);

			} catch (\Throwable $th) {
				
				return response()->json([
					'type' => 'error',
					'message' => $th->getMessage()
				], 400);

			}

		}

		public function save(Request $request){

			try {
				
				if (!$request->id) {

					// Save

					$result = DB::table($request->table)->insertGetId($request->except(['table']));

					$item = DB::table($request->table)->where('id', $result)->first();

					$message = "El paciente ha sido registrado exitosamente.";

				}else{

					// Update 
					$result = DB::table($request->table)->where('id', $request->id)->update($request->except(['id', 'table']));

					$item = DB::table($request->table)->where('id', $request->id)->first();

					$message = "La información del paciente ha sido actualizada exitosamente.";

				}
				
				$response = [
					"type" => "success",
					"message" => "La información ha sido registrada exitosamente.",
					"data" => $item
				];

				return response()->json($response);

			} catch (\Throwable $th) {
				
				return response()->json([
					'type' => 'error',
					'message' => $th->getMessage()
				], 400);

			}

		}
	}

?>