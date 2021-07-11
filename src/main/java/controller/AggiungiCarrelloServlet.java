package controller;

import model.beans.Carrello;
import model.beans.Prodotto;
import model.beans.ProdottoCarrello;
import model.dao.ProdottoDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AggiungiCarrelloServlet", value = "/AggiungiCarrelloServlet")
public class AggiungiCarrelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("user") == null){
            String address = "/login.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request, response);
        }

        if(session.getAttribute("carrello") != null){
            ProdottoCarrello prodotto = new ProdottoCarrello();
            Prodotto prodotto_provv = new Prodotto();
            try {
                ProdottoDAO prodottoDAO = new ProdottoDAO();
                int id_prodotto = Integer.parseInt(request.getParameter("prodotto"));
                prodotto_provv = prodottoDAO.getProdottoById(id_prodotto);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            System.out.println(prodotto_provv + " 1 ");
            prodotto.setProdotto(prodotto_provv);
            Carrello carrello = ((Carrello)session.getAttribute("carrello"));
            boolean trovato = false;
            for(ProdottoCarrello p: carrello.getProdotti()){
                if(p.getProdotto().getId() == prodotto_provv.getId()){
                    p.setQuantita(prodotto.getQuantita()+ Integer.parseInt(request.getParameter("quantita")));
                    trovato = true;
                    break;
                }
            }
            if(!trovato){
                prodotto.setQuantita(Integer.parseInt(request.getParameter("quantita")));
                carrello.aggiungiProdotto(prodotto);

            }


            String address = "/carrello.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request, response);

        }
        else if(session.getAttribute("carrello") == null){
            Carrello carrello = new Carrello();
            ProdottoCarrello prodotto = new ProdottoCarrello();
            Prodotto prodotto_provv = new Prodotto();
            try {
                ProdottoDAO prodottoDAO = new ProdottoDAO();
                int id_prodotto = Integer.parseInt(request.getParameter("prodotto"));
                prodotto_provv = prodottoDAO.getProdottoById(id_prodotto);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            System.out.println(prodotto_provv + " 2 ");
            prodotto.setProdotto(prodotto_provv);
            prodotto.setQuantita(Integer.parseInt(request.getParameter("quantita")));
            carrello.aggiungiProdotto(prodotto);
            session.setAttribute("carrello", carrello);

            String address = "/carrello.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request, response);
        }
        response.sendRedirect(request.getHeader("referer"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
