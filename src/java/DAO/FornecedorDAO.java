/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Fornecedor;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Programador
 */
public class FornecedorDAO extends Fornecedor {

    public EntityManager getEM() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("JSPVENDA");
        return factory.createEntityManager();
    }

    public List<Fornecedor> selecionar() {
        EntityManager em = getEM();
        Query qry = em.createQuery("SELECT u FROM Fornecedor u", Fornecedor.class);
        return qry.getResultList();
    }

    public Fornecedor selecionar(Fornecedor local) {
        EntityManager em = getEM();
        em.getTransaction().begin();
        Fornecedor cli = em.find(Fornecedor.class, local.getId());
        em.getTransaction().commit();
        em.close();
        return cli;
    }
    public Fornecedor salvar(Fornecedor local) {
        EntityManager em = getEM();
        em.getTransaction().begin();
        em.persist(local);
        em.getTransaction().commit();
        em.close();
        return local;
    }
    public Fornecedor update(Fornecedor local) {
        EntityManager em = getEM();
        em.getTransaction().begin();
        Fornecedor fornecedor = em.find(Fornecedor.class, local.getId());
        fornecedor.setRazaoSocial(local.getRazaoSocial());       
        fornecedor.setAtivo(local.getAtivo());
        em.merge(fornecedor);
        em.getTransaction().commit();
        em.close();
        return fornecedor;
    }

}
