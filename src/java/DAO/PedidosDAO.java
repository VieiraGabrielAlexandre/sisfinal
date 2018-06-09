/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Pedidos;
import Model.Pedidos;
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
public class PedidosDAO extends Pedidos {

    public EntityManager getEM() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("JSPVENDA");
        return factory.createEntityManager();
    }

    public List<Pedidos> selecionar() {
        EntityManager em = getEM();
        Query qry = em.createQuery("SELECT u FROM Pedidos u", Pedidos.class);
        return qry.getResultList();
    }

    public Pedidos salvar(Pedidos local) {
        EntityManager em = getEM();
        em.getTransaction().begin();
        em.persist(local);
        em.getTransaction().commit();
        em.close();
        return local;
    }

    public Pedidos selecionar(Pedidos local) {
        EntityManager em = getEM();
        em.getTransaction().begin();
        Pedidos ped = em.find(Pedidos.class, local.getId());
        em.getTransaction().commit();
        em.close();
        return ped;
    }   

    public Pedidos update(Pedidos local) {
        EntityManager em = getEM();
        em.getTransaction().begin();
        Pedidos ped = em.find(Pedidos.class, local.getId());
        ped.setId_cliente(local.getId_cliente());
        ped.setId_cliente(local.getId_usuario());
        em.merge(ped);
        em.getTransaction().commit();
        em.close();
        return ped;
    }

}
