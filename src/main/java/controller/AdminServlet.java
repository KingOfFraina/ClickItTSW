package controller;

import model.beans.Categoria;
import model.beans.Prodotto;
import model.dao.CategoriaDAO;
import model.dao.ProdottoDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;

@MultipartConfig
@WebServlet(name = "AdminServlet", urlPatterns = "/AdminServlet/*")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo() == null ? "/" : request.getPathInfo();

        if(path.equals("/aggiungiProdotto")){
            try {
                ProdottoDAO dao = new ProdottoDAO();
                Prodotto p = new Prodotto();
                p.setMarca(request.getParameter("marca"));
                p.setModello(request.getParameter("modello"));
                p.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
                p.setDescrizione(request.getParameter("descrizione"));
                p.setDimensioni(request.getParameter("dimensioni"));
                p.setPeso(Double.parseDouble(request.getParameter("peso")));
                CategoriaDAO cDao = new CategoriaDAO();
                Categoria c = new Categoria();
                c.setNomeCategoria("fotocamere");

                p.setCategoria(c);

                Part part = request.getPart("immagine");
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString(); //nome immagine

                p.setImmagine(fileName);
                dao.addProdotto(p);

                File file;
                try (InputStream fileStream = part.getInputStream()) {
                    String uploadRoot = System.getenv("CATALINA_HOME") + File.separator + "upload" + File.separator;
                    file = new File(uploadRoot + fileName);
                    if (!file.exists())
                        Files.copy(fileStream, file.toPath());
                }


            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }


        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
