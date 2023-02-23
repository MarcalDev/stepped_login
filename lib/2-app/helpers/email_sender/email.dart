import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
class Email{
  late String _username;
  var smtpServer;
  Email(String username, String password){
    _username = username;    
    smtpServer = gmail(_username, password);
  }

  Future<bool> sendMessage(String message, String recipient, String subject) async{
    
    final email = Message();
    
    email.subject = subject;
    email.text = message;
    email.from = Address(_username);
    email.recipients.add(_username);
    
      try{
        final sendReport = await send(email, smtpServer);
        print('Message sent: ' + sendReport.toString());

        return true;
      }on MailerException catch(e){
        print('Message not sent');
        for(var p in e.problems){
          print('Problem: ${p.code}: ${p.msg}');
        }
        return false;
      }
  }
}