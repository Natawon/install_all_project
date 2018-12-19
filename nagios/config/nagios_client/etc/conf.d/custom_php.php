<?php
// php custom_php.php "peerasan.b@dootvmedia.com" "Test mail" "Hello\nMessage"
# Get the Argvs
$to = $argv[1]; // To (CONTACTEMAIL)
$subject = $argv[2]; // Subject
$msg = $argv[3]; // message
$msg_txt = str_replace('\n', "\n", $msg);
$msg_html = str_replace('\n', "<br/>\n", $msg);


/*
curl -s --user 'api:YOUR_API_KEY' \
    https://api.mailgun.net/v3/YOUR_DOMAIN_NAME/messages \
    -F from='Excited User <mailgun@YOUR_DOMAIN_NAME>' \
    -F to=YOU@YOUR_DOMAIN_NAME \
    -F to=bar@example.com \
    -F subject='Hello' \
    -F text='Testing some Mailgun awesomness!'
*/

define('MAILGUN_URL', 'https://api.mailgun.net/v3/mg.open-cdn.com');
define('MAILGUN_KEY', 'key-73437bf71d4b6b8cbfb3b0523d710568'); 
define('MAILGUN_LOGIN', 'postmaster@mg.open-cdn.com'); 

function sendmailbymailgun($to,$toname,$mailfromname,$mailfrom,$subject,$html,$text,$tag,$replyto) {
    $array_data = array(
		'from'=> "'". $mailfromname ."'".' <'.$mailfrom.'>',
		'to'=> "'". $toname ."'".' <'.$to.'>',
		'subject'=>$subject,
		'html'=>"'". $html ."'",
		'text'=>"'". $text ."'",
		'o:tracking'=>'yes',
		'o:tracking-clicks'=>'yes',
		'o:tracking-opens'=>'yes',
		'o:tag'=>$tag,
		'h:Reply-To'=>$replyto
    );

    $session = curl_init(MAILGUN_URL.'/messages');
        //curl_setopt($session, CURLOPT_VERBOSE, true);
        curl_setopt($session, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
        curl_setopt($session, CURLOPT_USERPWD, 'api:'.MAILGUN_KEY);
        curl_setopt($session, CURLOPT_POST, true);
        curl_setopt($session, CURLOPT_POSTFIELDS, $array_data);
        curl_setopt($session, CURLOPT_HEADER, false);
        curl_setopt($session, CURLOPT_ENCODING, 'UTF-8');
        curl_setopt($session, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($session, CURLOPT_SSL_VERIFYPEER, false);
        $response = curl_exec($session);
    curl_close($session);
    echo $response;
    $results = json_decode($response, true);
    return $results;
}

sendmailbymailgun(
    $to,
    $to,
    MAILGUN_LOGIN,
    MAILGUN_LOGIN,
    $subject,
    $msg_html,
    $msg_txt,
    "notify",
    MAILGUN_LOGIN
);

/*
ref: 
 - https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/3/en/objectdefinitions.html#contact
 - https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/3/en/macrolist.html

*/

?>
