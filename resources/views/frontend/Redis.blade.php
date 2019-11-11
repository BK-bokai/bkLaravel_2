<?php
$redis = app('redis.connection');
$channel='test-channel';
$redis->psubscribe(['*'], function($message, $channel) {
    echo $message;
});
?>

