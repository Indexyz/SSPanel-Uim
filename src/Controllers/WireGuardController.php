<?php

namespace App\Controllers;

use App\Models\{
    WireGuard
};

use App\Utils\{
    Tools
};

use Slim\Http\{
    Request,
    Response
};

class WireGuardController extends UserController
{
    public function index($request, $response, $args)
    {
        $pageNum = $request->getQueryParams()['page'] ?? 1;
        $devices = WireGuard::orderBy('id', 'desc')->where('user_id', $this->user->id)->paginate(15, ['*'], 'page', $pageNum);
        $devices->setPath('/user/wireguard');
        $render = Tools::paginate_render($devices);

        return $response->write(
            $this->view()
                ->assign('devices', $devices)
                ->assign('render', $render)
                ->display('user/wiregaurd.tpl')
        );
    }
}
