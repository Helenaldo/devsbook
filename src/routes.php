<?php
use core\Router;

$router = new Router();

$router->get('/', 'HomeController@index');

//rota de login
$router->get('/login', 'LoginController@signin');

//rota de cadastgro
$router->get('/cadastro', 'LoginController@signup');



$router->post('/login', 'LoginController@signinAction');

$router->post('/cadastro', 'LoginController@signupAction');

$router->post('/post/new', 'PostController@new');


//rotas para acessar o perfil do usuário logado e de outro usuário. Ou para seguir/deixar de seguir
$router->get('/perfil/{id}/fotos', 'ProfileController@photos');
$router->get('/perfil/{id}/amigos', 'ProfileController@friends');
$router->get('/perfil/{id}/follow', 'ProfileController@follow');
$router->get('/perfil/{id}', 'ProfileController@index');
$router->get('/perfil', 'ProfileController@index');

$router->get('/amigos', 'ProfileController@friends');
$router->get('/fotos', 'ProfileController@photos');

$router->get('/pesquisa', 'SearchController@index');

$router->get('/config', 'ConfigController@index');
$router->post('/config', 'ConfigController@save');

$router->get('/ajax/like/{id}', 'AjaxController@like');
$router->post('/ajax/comment', 'AjaxController@comment');
$router->post('/ajax/upload', 'AjaxController@upload');


//Para fazer o logoff
$router->get('/sair', 'LoginController@logout');




//$router->get('/amigos')
//$router->get('/fotos')
//$router->get('/config')
