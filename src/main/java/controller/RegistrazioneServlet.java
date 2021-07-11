package controller;

import model.beans.Utente;
import model.dao.UtenteDAO;
import org.apache.commons.io.FileUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import utils.FormException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.text.Normalizer;
import java.util.ArrayList;

@WebServlet(name = "RegistrazioneServlet", urlPatterns = "/RegistrazioneServlet/*")
@MultipartConfig
public class RegistrazioneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            UtenteDAO dao = new UtenteDAO();
            ArrayList errori = new ArrayList();
            Utente u = new Utente();
            String nome = request.getParameter("nome");
            String cognome = request.getParameter("cognome");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String telefono = request.getParameter("telefono");


            Part part = request.getPart("file");
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();


            File file;
            try (InputStream fileStream = part.getInputStream()) {
                String uploadRoot = System.getenv("CATALINA_HOME") + File.separator + "upload" + File.separator;;
                file = new File(uploadRoot + fileName);
                if (!file.exists())
                    Files.copy(fileStream, file.toPath());
            }

            if(nome == null || nome.equals("")){
                errori.add("Errore nome, riprovare");
            }

            else if(cognome == null || cognome.equals("")){
                errori.add("Errore cognome, riprovare");
            }

            else if(password == null || password.equals("")){
                errori.add("Errore password, riprovare");
            }

            else if(email == null || email.equals("")){
                errori.add("Errore email, riprovare");
            }

            else if(UtenteDAO.isEmailPresent(email)){
                errori.add("Email già in utilizzo");
            }

            else if(telefono == null || telefono.equals("")){
                errori.add("Errore telefono, riprovare");
            }

            if(u == null){
                throw new NullPointerException("Internal error");
            }



            else{
                u.setNome(nome);
                u.setCognome(cognome);
                u.setPassword(password);
                u.setEmail(email);
                u.setTelefono(telefono);
                u.setImmagine(fileName);


                if(errori.size()>0){
                    request.setAttribute("utente", u);
                    request.setAttribute("errori", errori);
                    String address = "/registrazione.jsp";
                    RequestDispatcher dispatcher = request.getRequestDispatcher(address);
                    dispatcher.forward(request, response);
                }else{
                    dao.addUtente(u);
                    request.setAttribute("utente", u);
                    request.setAttribute("errori", errori);
                    request.getSession().setAttribute("user", u);
                    response.sendRedirect(request.getServletContext().getContextPath() + "/landingpage");
                }
            }




        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
