/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Usuario;
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
public class UsuarioDAO extends Usuario {

    public EntityManager getEM() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("JSPVENDA");
        return factory.createEntityManager();
    }

    public List<Usuario> selecionar() {
        EntityManager em = getEM();
        Query qry = em.createQuery("SELECT u FROM Usuario u", Usuario.class);
        return qry.getResultList();
    }

    public Usuario salvar(Usuario local) {
        EntityManager em = getEM();
        em.getTransaction().begin();
        em.persist(local);
        em.getTransaction().commit();
        em.close();
        return local;
    }

    public Usuario selecionar(Usuario local) {
        EntityManager em = getEM();
        em.getTransaction().begin();
        Usuario usu = em.find(Usuario.class, local.getId());
        em.getTransaction().commit();
        em.close();
        return usu;
    }

    public List<Usuario> selecionarUsuario(Usuario local) {
        EntityManager em = getEM();
        Query qry = em.createQuery("SELECT u FROM Usuario u where u.login  = :login and u.senha = :senha and u.ativo =1", Usuario.class)
                .setParameter("login", local.getLogin())
                .setParameter("senha", local.getSenha()
                );
        out.print(local.getLogin()
        );
        return qry.getResultList();
    }

    public Usuario update(Usuario local) {
        EntityManager em = getEM();
        em.getTransaction().begin();
        Usuario usu = em.find(Usuario.class, local.getId());
        usu.setNome(local.getNome());
        usu.setLogin(local.getLogin());
        usu.setSenha(local.getSenha());
        usu.setAtivo(local.getAtivo());
        em.merge(usu);
        em.getTransaction().commit();
        em.close();
        return usu;
    }

}
