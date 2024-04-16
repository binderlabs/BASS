<?php

use App\Http\Controllers\API1UsersController;
use App\Http\Controllers\JustWeakTokenController;
use App\Http\Controllers\MarketplaceController;
use App\Http\Controllers\API6AuthController;
use App\Models\API1Users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


/* Flag Submit Dashboard */

Route::get('dashboard/flag','App\Http\Controllers\FlagController@verify');


/* API 1 */

Route::get('api1/user/{id}','App\Http\Controllers\API1UsersController@show');

Route::post('api1/user','App\Http\Controllers\API1UsersController@store');

Route::put('api1/user/{id}','App\Http\Controllers\API1UsersController@update');



/* API 2 */

Route::post('api2/user/login','App\Http\Controllers\API2UsersController@login');

Route::get('api2/user/details','App\Http\Controllers\API2UsersController@show');


/* API 3 */

Route::post('api3old/user','App\Http\Controllers\API3UsersController@store');

Route::post('api3old/user/login','App\Http\Controllers\API3UsersController@login');

Route::get('api3old/comment','App\Http\Controllers\API3CommentsController@show');

Route::post('api3old/comment','App\Http\Controllers\API3CommentsController@store');

/* API 4 */

Route::post('api4/login','App\Http\Controllers\API4UsersController@login');

Route::post('api4/otp/verify','App\Http\Controllers\API4UsersController@verify');

Route::get('api4/user','App\Http\Controllers\API4UsersController@show');

/* API 5 */

Route::get('api5/user/{id}','App\Http\Controllers\API5UsersController@show');

Route::post('api5/user','App\Http\Controllers\API5UsersController@store');

Route::get('api5/users','App\Http\Controllers\API5UsersController@showall');


/* API 3 */

Route::post('api3/user','App\Http\Controllers\API3UsersController@store');

Route::get('api3/user/me','App\Http\Controllers\API3UsersController@show');

/* API 7 Temp */

Route::post('api8/user','App\Http\Controllers\API8UsersController@store');

Route::get('api8/user/login','App\Http\Controllers\API8UsersController@login');

Route::get('api8/user/key','App\Http\Controllers\API8UsersController@showkey');

Route::get('api8/user/logout','App\Http\Controllers\API8UsersController@logout');

/* API 10 Temp*/

Route::post('api10/user/login','App\Http\Controllers\API10UsersController@login');

Route::get('api10/user/secret','App\Http\Controllers\API10UsersController@showsecret');

/* API 9 v1 */

Route::post('api9/v1/user/login','App\Http\Controllers\API9UsersController@login');

/* API 9 v2 */

Route::post('api9/v2/user/login','App\Http\Controllers\API9UsersController@login')->middleware('throttle:5,1');

/* API 6 */
Route::post('/api6/login', [API6AuthController::class, 'apiLogin']);
Route::get('api6/user/87faf56f-5be6-4932-927b-16559d6755bd/details','App\Http\Controllers\API6Controller@flag');


// API6 Marketplace routes
Route::get('/api6/marketplace/items', [MarketplaceController::class, 'listItems']);
Route::post('/api6/marketplace/premium/purchase', [MarketplaceController::class, 'bulkPurchase']);


/* JustWeakToken */

Route::post('jwt/user','App\Http\Controllers\JustWeakTokenController@store');

Route::get('jwt/user','App\Http\Controllers\JustWeakTokenController@show');


/* SSRF API 7 */

Route::get('api7','App\Http\Controllers\SsrfController@show');


/* StickyNotes */

Route::post('stickynotes','App\Http\Controllers\StickyNotesController@store');

Route::get('stickynotes','App\Http\Controllers\StickyNotesController@show');



