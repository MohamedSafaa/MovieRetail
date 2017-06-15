package Model ;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendEmail {

    public SendEmail(String to) {
        String USER_NAME = "samirshampo19@gmail.com";  // GMail user name (just the part before "@gmail.com")
        String PASSWORD = "aliweka123456789"; // GMail password
        String from = USER_NAME;
        String pass = PASSWORD;
        String subject = "Late Rent";
        String body = "please , return your late rented movie.";
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[1];

            // To get the array of addresses
            
            toAddress[0] = new InternetAddress(to);
            

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }
}