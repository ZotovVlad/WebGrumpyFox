package webgrumpyfox.webgrumpyfox.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import webgrumpyfox.webgrumpyfox.model.Game;

import java.util.List;

@Repository
public class GameDAOImpl implements GameDAO {

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Game> allGames(int page) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Game").setFirstResult(10 * (page - 1)).setMaxResults(10).list();
    }

    @Override
    public void add(Game game) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(game);
    }

    @Override
    public void delete(Game game) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(game);
    }

    @Override
    public void edit(Game game) {
        Session session = sessionFactory.getCurrentSession();
        session.update(game);
    }

    @Override
    @SuppressWarnings("unchecked")
    public Game getById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Game where id = :id");
        query.setParameter("id", id);
        return ((List<Game>) query.getResultList()).get(0);
    }

    @Override
    public int gamesCount() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("select count(*) from Game", Number.class).getSingleResult().intValue();
    }

}