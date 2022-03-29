<?php 

	namespace App\Http\Controllers;

	use Illuminate\Http\Request;

	use App\Ficha_Paciente;
	use App\Rol_Ficha_Paciente;
	use App\Servicio_Salud;
	use App\Paciente;
	use App\Antecedentes_Gineco;
	use App\Antecedentes_Paciente;
	use App\Examen_Fisico;

	use Illuminate\Support\Facades\DB;

	use Carbon\Carbon;
	
	class PatientController extends Controller{

		public function get_patients(Request $request){

			try {
				
				$headers = [
					[
						"text" => "Paciente",
						"value" => "nombre",
						"align" => "start",
						"sortable" => false,
						"width" => "25%"
					],
					[
						"text" => "Referido a",
						"value" => "servicio_salud",
						"align" => "start",
						"sortable" => false,
						"width" => "25%"
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

				$items = DB::select("	SELECT T1.*, T2.nombre AS servicio_salud
										FROM paciente T1
										INNER JOIN servicio_salud T2
										ON T1.referido_a = T2.id
										WHERE T1.deleted_at IS NULL
										AND T1.ubicacion_id IN (
											SELECT id
											FROM ubicacion
											WHERE clinica_id = '$request->clinica_id'
										)
									");

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
				
				$request->offsetSet('updated_at', Carbon::now());

				if (!$request->id) {

					// Save

					$request->offsetSet('created_at', Carbon::now());

					$result = DB::table($request->table)->insertGetId($request->except(['table']));

					$item = DB::table($request->table)->where('id', $result)->first();

				}else{

					// Update 

					$result = DB::table($request->table)->where('id', $request->id)->update($request->except(['id', 'table', 'created_at']));

					$item = DB::table($request->table)->where('id', $request->id)->first();

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

		public function get_detail(Request $request){

			try {
				
				$patient = Paciente::find($request->id);

				$medical_history = Antecedentes_Paciente::where('paciente_id', $request->id)->first();

				$obstetric = Antecedentes_Gineco::where('paciente_id', $request->id)->first();

				$physical_exam = Examen_Fisico::where('paciente_id', $request->id)->first();

				$response = [
					"patient" => $patient,
					"medical_history" => $medical_history,
					"obstetric" => $obstetric,
					"physical_examen" => $physical_exam
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