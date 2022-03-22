<?php 

	namespace App\Http\Controllers;

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
						"value" => "c_externa",
						"align" => "start",
						"sortable" => false,
						"width" => "10%"
					],
					[
						"text" => "Acciones",
						"value" => "acciones",
						"align" => "start",
						"sortable" => false,
						"width" => "10%"
					]
				];

				$items = [];

				$response = [
					"headers" => $headers,
					"items" => $items
				];

				return response()->json($response);
			
			} catch (\Throwable $th) {
				
				return response()->json($th->getMessage());

			}
			

		}

	}

?>