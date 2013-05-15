<?php

$body = http_get_request_body();
// mail('andreyvit@me.com', "LiveReload subscription hook", $body, "From: notification@livereload.com");

$result = json_decode($body);

foreach($result->Events as $event) {
  $ip = $event->SignupIPAddress;
  $email = $event->EmailAddress;
  $date  = $event->Date;
  $about = '';
  $notified = FALSE;
  foreach ($event->CustomFields as $field) {
    if ($field->Key == 'About') {
      $about = $field->Value;
    }
  }
  if (!empty($about)) {
    $msg = "Subscriber: $email\nDate: $date\n\nMessage:\n$about\n\n-- LiveReload";
    $notified = mail('andrey@tarantsov.com', "LiveReload subscription: $email", $msg, "From: notification@livereload.com\r\nReply-To: $email");
  }
}

?>
