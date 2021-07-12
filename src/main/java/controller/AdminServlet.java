package controller;

import model.beans.Categoria;
import model.beans.Prodotto;
import model.dao.CategoriaDAO;
import model.dao.ProdottoDAO;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;

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
                    String uploadRoot = "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0" + File.separator + "upload" + File.separator;
                    file = new File(uploadRoot + fileName);
                    if (!file.exists())
                        Files.copy(fileStream, file.toPath());
                }


            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }


        }

        if(path.equals("/mostraProdotti")){
            ProdottoDAO dao = null;
            try {
                dao = new ProdottoDAO();
                ArrayList<Prodotto> prodotti2 = dao.getProdotti();

                JSONObject jsonObject = new JSONObject();
                JSONArray array = new JSONArray();

                for(Prodotto p: prodotti2){
                    JSONObject provv = new JSONObject();
                    provv.put("id", p.getId());
                    provv.put("marca", p.getMarca());
                    provv.put("modello", p.getModello());
                    provv.put("categoria", p.getCategoria().getNomeCategoria());
                    provv.put("prezzo", p.getPrezzo());

                    array.put(provv);
                }

                jsonObject.put("prodotti",array);
                String risultato = jsonObject.toString();

                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                out.print(risultato);
                out.flush();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }

        if(path.equals("/eliminaProdotto")){
            try {
                ProdottoDAO dao = new ProdottoDAO();
                dao.eliminaProdotto(Integer.parseInt(request.getParameter("id")));
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
