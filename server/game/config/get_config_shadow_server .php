<?php

header('Content-type: text/plain');
header('Access-Control-Allow-Origin: *');

$result = array();
$result['data'] = array();
$result['error'] = null;

try
{
	$file_name = 'config_shadow_server.json';

	if (file_exists($file_name))
	{
		// Retrieve the messages
		$str_json = file_get_contents($file_name);

		if (strlen($str_json) > 0)
		{
			$json = json_decode($str_json, true);

			$result['data'] = $json;
			// $result['data'] = 'blah';
		}
	}
	else
	{
		$result['error'] = "File 'config_game_server.json' not found.";
	}
}
catch (Exception $e)
{
	$result['error'] = $e->getMessage();
}

echo json_encode($result, JSON_UNESCAPED_SLASHES);

?>