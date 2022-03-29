<?php 
	
	namespace App\Http\Controllers;

	use Illuminate\Http\Request;
	
	use Illuminate\Support\Facades\DB;

	use App\Ubicacion;
	use App\Clinica;

	class ReferralController extends Controller{

		public function get_referrals(Request $request){

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
						"text" => "Referido desde",
						"value" => "referido_desde",
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
						"align" => "center",
						"sortable" => false,
						"width" => "10%"
					],
					[
						"text" => "Consulta Externa",
						"value" => "consulta_externa",
						"align" => "center",
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

				foreach ($items as &$item) {
					
					$location = Ubicacion::find($item->ubicacion_id);

					$clinic = Clinica::find($location->clinica_id);

					$item->clinica = $clinic->nombre;
					$item->ubicacion = $location->direccion;

				}

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

	}

?>