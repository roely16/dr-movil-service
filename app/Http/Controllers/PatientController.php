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
	use App\Ficha_Referencia;

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
				
				return response()->json([
					'type' => 'error',
					'message' => $th->getMessage()
				], 400);

			}
			

		}

		public function get_tabs_form(Request $request){

			try {
				
				// Get tabs
				
				$tabs_ficha = DB::select("	SELECT *
											FROM ficha_paciente t1
											INNER JOIN rol_ficha_paciente t2
											ON t1.id = t2.ficha_paciente_id
											WHERE t2.rol_id = $request->rol_id
											ORDER BY t2.orden ASC
										");

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

				$reference_sheet = Ficha_Referencia::where('paciente_id', $request->id)->first();

				$response = [
					"patient" => $patient,
					"medical_history" => $medical_history,
					"obstetric" => $obstetric,
					"physical_examen" => $physical_exam,
					"reference_sheet" => $reference_sheet
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