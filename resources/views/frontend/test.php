<?php
$redis = app('redis.connection');
print_r($redis->keys('*'));
$redis->publish('test-channel', json_encode(['foo' => 'bar']));
?>