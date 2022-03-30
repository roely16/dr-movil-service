<?php 

    namespace App\Http\Controllers;

    use Illuminate\Http\Request;

    use App\Usuario;
    use App\Rol;
    use App\Clinica;
    use App\Ubicacion;
    use App\Menu;
    use App\Menu_Rol;
use App\Servicio_Salud;
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

                if ($user->clinica_id) {
                    
                    $clinic = Clinica::find($user->clinica_id);
                    $location = Ubicacion::where('clinica_id', $clinic->id)->where('deleted_at', null)->first();

                    $user->clinica = $clinic->nombre;
                    $user->ubicacion = $location->direccion;
                    $user->ubicacion_id = $location->id;

                    if (!$location) {
                    
                        return response()->json([
                            'type' => 'error',
                            'message' => 'La clínica no cuenta con una ubicación definida.  Por favor ponerse en contacto con el equipo AVE.'
                        ], 400);
    
                    }

                }

                if ($user->servicio_salud_id) {
                    
                    $servicio_salud = Servicio_Salud::find($user->servicio_salud_id);

                    $user->clinica = $servicio_salud->nombre;

                }
            
                // Sidebar options
                $menu = Menu::whereIn('id', Menu_Rol::select('menu_id')->where('rol_id', $role->id)->get()->toArray())->get();
                $user->menu = $menu;

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