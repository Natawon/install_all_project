<?php
$to = $argv[1]; // To (CONTACTEMAIL)
$subject = $argv[2]; // Subject
$msg = $argv[3]; // message
$msg_txt = str_replace('\n', "\n", $msg);

function send_message($to, $msg_txt){
    $strAccessToken = "
YqM1tw20f6g2y8QaOR5KGincPZ9VWSwfIruGxshqlc4wYbnf3WMsvMoW9oPmMBPyqYyf9KdcGye+MrIf4VV51uMvzNv/pBmD6Z1nw03p22L2ZDzhRrgNbOnVAZlwgcC7H2L4R9/O2D24orbu8tOW3gdB04t89/1O/w1cDnyilFU=

";
    $strUrl = "https://api.line.me/v2/bot/message/push";

    $arrHeader = array();
    $arrHeader[] = "Content-Type: application/json";
    $arrHeader[] = "Authorization: Bearer {$strAccessToken}";
        
    $arrPostData = array();
    $arrPostData['to'] = $to;
    $arrPostData['messages'][0]['type'] = "text";
    $arrPostData['messages'][0]['text'] = $msg_txt;

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL,$strUrl);
    curl_setopt($ch, CURLOPT_HEADER, false);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $arrHeader);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($arrPostData));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    $result = curl_exec($ch);
    curl_close ($ch);

    echo $result;
}

send_message('Uf396a41aa15c6092da5720e7c5aa35f9', $msg_txt);
send_message('U4b2c10bd665e86ccd0d317e60e29c648', $msg_txt);
send_message('U9bdeb903c11083989b656e230ae948f9', $msg_txt);
send_message('Uea15fced619769c15f8e32cce50ed279', $msg_txt);
?>
