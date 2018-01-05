var myEmail="charles.heath.berman@gmail.com";
var sendMessage = function (fromId, toId, msg) {

  var from = myEmail;
  var to = myEmail;
  var fromEmail = myEmail;
  var toEmail = myEmail;
  Email.send({
    from: fromEmail,
    to: toEmail,
    replyTo: fromEmail || undefined,
    subject: "Meteorize: "+from.username+" sent you this email !",
    text: "Hello "+to.username+",\n\n"+msg+
    "Thank you to use Meteorize!\n\n"+
    "The Meteorize Team.\n"+
    Meteor.absoluteUrl()+"\n"
  });
}

Meteor.startup(function(){

  var email_name = 'postmaster@sandbox279d23ea09734ae68bb2b53eac201b4d.mailgun.org';
  var password = 'Mookie_jones313';
//  process.env.MAIL_URL = 'smtp://'+email_name'+':'+password'+'@smtp.mailgun.org:587';

});