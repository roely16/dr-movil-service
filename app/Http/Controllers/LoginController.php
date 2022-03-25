<?php 

    namespace App\Http\Controllers;

    use Illuminate\Http\Request;

    use App\Usuario;

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