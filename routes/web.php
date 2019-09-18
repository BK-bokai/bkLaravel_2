<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Route::get('/register', function () {
//     return view('frontend.register');
// });
Route::get('register', 'Auth\RegisterController@showRegistrationForm')->name('register');

Route::post('register', 'Auth\RegisterController@register');

Route::get('confirm/{active}','frontend\ConfirmUserController@confirm')->name('confirm');

Route::get('/email', 'frontend\RegisterEmailController@send');

Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');

Route::post('login', 'Auth\LoginController@login')->name('dologin');


Route::prefix('admin')->name('admin.')->group(function () {

    Route::get('/', 'backend\IndexController@index');

    Route::get('img', 'backend\ImgController@index')->name('img');    
    Route::post('img', 'backend\ImgController@create');
    Route::delete('img/{image}', 'backend\ImgController@delete');
    Route::put('img/{image}', 'backend\ImgController@update');

    Route::get('work', 'backend\WorkController@index');
    Route::get('member', 'backend\MemberController@index');

    Route::get('logout', 'Auth\LoginController@logout')->name('logout');
});

Route::get('/home', 'HomeController@index')->name('home');
