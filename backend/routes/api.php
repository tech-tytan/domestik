<?php

use App\Http\Controllers\AdminForgotPasswordController;
use App\Http\Controllers\AdminHeaderController;
use App\Http\Controllers\AdminProfileController;
use App\Http\Controllers\AdminSigninController;
use App\Http\Controllers\AdminSignoutController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\LocationController;
use App\Http\Controllers\OverviewController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\TransactionController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UserForgotPasswordController;
use App\Http\Controllers\UserHeaderController;
use App\Http\Controllers\UserProfileController;
use App\Http\Controllers\UserSigninController;
use App\Http\Controllers\UserSignoutController;
use App\Http\Controllers\UserTransactionController;
use App\Http\Controllers\VerifyController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::resource('home',HomeController::class);

Route::resource('admin_signin',AdminSigninController::class);

Route::resource('admin_forgot_password',AdminForgotPasswordController::class);

Route::resource('admin_header',AdminHeaderController::class)->middleware("user");

Route::resource('dashboard',DashboardController::class)->middleware("user");

Route::resource('transactions',TransactionController::class)->middleware("user");

Route::resource('users',UserController::class)->middleware("user");

Route::resource('locations',LocationController::class)->middleware("user");

Route::resource('admin_profile',AdminProfileController::class)->middleware("user");

Route::resource('admin_signout',AdminSignoutController::class);

Route::resource('user_signin',UserSigninController::class);

Route::resource('user_forgot_password',UserForgotPasswordController::class);

Route::resource('register',RegisterController::class);

Route::resource('user_header',UserHeaderController::class)->middleware("user");

Route::resource('overview',OverviewController::class)->middleware("user");

Route::resource('user_transactions',UserTransactionController::class)->middleware("user");

Route::resource('user_profile',UserProfileController::class)->middleware("user");

Route::resource('user_signout',UserSignoutController::class);

Route::resource('verify',VerifyController::class);
