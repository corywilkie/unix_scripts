#!/bin/bash

cp /dev/null mailer

echo "Body" > content

export MAILTO=""
export CONTENT="content"
export SUBJECT="Subject"
(
 echo "Subject: $SUBJECT"
 echo "MIME-Version: 1.0"
 echo "Content-Type: text/html"
 echo "Content-Disposition: inline"
 echo '<HTML><BODY><PRE>'
 cat $CONTENT
 echo '</PRE></BODY></HTML>'
) | sendmail $MAILTO
