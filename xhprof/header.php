<?php

if (!extension_loaded('tideways_xhprof')) {
    return;
}

require_once dirname(__DIR__) . '/vendor/autoload.php';

use XHGui\Application;
use XHGui\Config;

Config::load(dirname(__DIR__) . '/config/config.php');

if (!isset($_SERVER['REQUEST_TIME_FLOAT'])) {
    $_SERVER['REQUEST_TIME_FLOAT'] = microtime(true);
}

tideways_xhprof_enable(
    TIDEWAYS_XHPROF_FLAGS_MEMORY | TIDEWAYS_XHPROF_FLAGS_MEMORY_MU | TIDEWAYS_XHPROF_FLAGS_MEMORY_PMU | TIDEWAYS_XHPROF_FLAGS_CPU
);

register_shutdown_function(
    static function () {
        $data['profile'] = tideways_xhprof_disable();

        $uri = $_SERVER['REQUEST_URI'] ?? null;
        if (empty($uri) && isset($_SERVER['argv'])) {
            $cmd = basename($_SERVER['argv'][0]);
            $uri = $cmd . ' ' . implode(' ', array_slice($_SERVER['argv'], 1));
        }

        $time = array_key_exists('REQUEST_TIME', $_SERVER)
            ? $_SERVER['REQUEST_TIME']
            : time();
        $requestTimeFloat = explode('.', $_SERVER['REQUEST_TIME_FLOAT']);
        if (!isset($requestTimeFloat[1])) {
            $requestTimeFloat[1] = 0;
        }

        $app = new Application();
        $saver = $app->getSaver();

        $data['meta'] = [
            'url' => $uri,
            'SERVER' => $_SERVER,
            'get' => $_GET,
            'env' => $_ENV,
            'simple_url' => '',
            'request_ts' => $time,
            'request_ts_micro' => [
                'sec' => $requestTimeFloat[0],
                'usec' => $requestTimeFloat[1],
            ],
            'request_date' => date('Y-m-d', $time),
        ];

        $saver->save($data);
    }
);
