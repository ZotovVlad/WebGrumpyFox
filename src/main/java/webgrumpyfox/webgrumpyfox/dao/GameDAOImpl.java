package webgrumpyfox.webgrumpyfox.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import webgrumpyfox.webgrumpyfox.model.Game;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class GameDAOImpl implements GameDAO {

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Game> allGames() {
        Session session = sessionFactory.getCurrentSession();
        List<Game> games = session.createQuery("from Game").getResultList();
        List<Game> sortedUsers = games.stream()
                .sorted(Comparator.comparing(Game::getRating).reversed())
                .collect(Collectors.toList());
        return sortedUsers;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Game> topGamesByCount(int count) {
        Session session = sessionFactory.getCurrentSession();
        List<Game> games = session.createQuery("from Game").getResultList();
        List<Game> sortedUsers = games.stream()
                .sorted(Comparator.comparing(Game::getRating).reversed())
                .limit(count)
                .collect(Collectors.toList());
        return sortedUsers;
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