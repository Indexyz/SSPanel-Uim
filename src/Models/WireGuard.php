<?php

namespace App\Models;

class WireGuard extends Model
{
    protected $connection = 'default';
    protected $table = 'wireguard_device';

    public function user(): User
    {
        return User::find($this->user_id);
    }

    public function ip() {
        $user = $this->user();

        $uuid = substr(str_replace("-", "", $user->uuid), 0, 24);
        $addr = "";

        for ($x = 0; $x < 6; $x++) {
            $cur_hex = substr($uuid, $x * 4, 4);
            $addr = $addr . ltrim($cur_hex, "0") . ":";
        }

        return $_ENV['wireguard_prefix'] . $addr . $this->hex_addr;
    }
}
