<?php 

    namespace App\Http\Controllers;

    use Illuminate\Http\Request;

    use App\Usuario;
    use App\Rol;
    use App\Clinica;
    use App\Ubicacion;

    use Illuminate\Support\Facades\Hash;

    class LoginController extends Controller{

        public function login(Request $request){

            try {
                
                $user = Usuario::where('email', $request->email)->first();

                if (!$user) {
                    
                    $response = [
                        'type' => 'info',
                        'message' => 'El correo electrónico o la contraseña son incorrectos.'
                    ];

                    return response()->json($response, 400);

                }

                // Check password

                if (!Hash::check($request->password, $user->password)){

                    $response = [
                        'type' => 'info',
                        'message' => 'El correo electrónico o la contraseña son incorrectos.'
                    ];

                    return response()->json($response, 400);

                }

                // Get user detail
                $role = Rol::find($user->rol_id);

                $user->rol = $role->nombre;

                $clinic = Clinica::find($user->clinica_id);
                $location = Ubicacion::where('clinica_id', $clinic->id)->where('deleted_at', null)->first();

                if (!$location) {
                    
                    return response()->json([
                        'type' => 'error',
                        'message' => 'La clínica no cuenta con una ubicación definida.  Por favor ponerse en contacto con el equipo AVE.'
                    ], 400);

                }

                $user->clinica = $clinic->nombre;
                $user->ubicacion = $location->direccion;
                $user->ubicacion_id = $location->id;

                $response = [
                    'user' => $user
                ];

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