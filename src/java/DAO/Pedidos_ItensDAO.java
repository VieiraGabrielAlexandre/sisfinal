/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;


import Model.Pedidos_itens;
import static java.lang.System.out;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Programador
 */
public class Pedidos_ItensDAO extends Pedidos_itens {

    public EntityManager getEM() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("JSPVENDA");
        return factory.createEntityManager();
    }

    public List<Pedidos_itens> selecionar() {
        EntityManager em = getEM();
        Query qry = em.createQuery("SELECT u FROM Pedidos_itens u", Pedidos_itens.class);
        return qry.getResultList();
    }
      public List<Pedidos_itens> selecionarDetalhes(Pedidos_itens local) {
        EntityManager em = getEM();
        Query qry = em.createQuery("SELECT u FROM Pedidos_itens u where u.id_pedido  = :id_pedido", Pedidos_itens.class)
                .setParameter("id_pedido", local.getId_pedido()
                );
       
        return qry.getResultList();
    }

    public Pedidos_itens salvar(Pedidos_itens local) {
        EntityManager em = getEM();
        em.getTransaction().begin();
        em.persist(local);
        em.getTransaction().commit();
        em.close();
        return local;
    }

    public Pedidos_itens selecionar(Pedidos_itens local) {
        EntityManager em = getEM();
        em.getTransaction().begin();
        Pedidos_itens ped = em.find(Pedidos_itens.class, local.getId());
        em.getTransaction().commit();
        em.close();
        return ped;
    }       


    public Pedidos_itens update(Pedidos_itens local) {
        EntityManager em = getEM();
        em.getTransaction().begin();
        Pedidos_itens ped = em.find(Pedidos_itens.class, local.getId());
        ped.setDescricao(local.getDescricao());
        ped.setId_pedido(local.getId_pedido());
        ped.setQuantidade(local.getQuantidade());
        ped.setValor_total(local.getValor_total());
        ped.setValor_total(local.getValor_total());
        em.merge(ped);
        em.getTransaction().commit();
        em.close();
        return ped;
    }

}
