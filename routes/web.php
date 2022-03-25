<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->post('/get_patients', 'PatientController@get_patients');
$router->post('/get_referrals', 'ReferralController@get_referrals');

$router->post('/register', 'RegisterController@register');

$router->get('/get_register_data', 'RegisterController@get_data');