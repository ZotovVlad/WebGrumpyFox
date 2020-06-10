package webgrumpyfox.webgrumpyfox.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import webgrumpyfox.webgrumpyfox.model.User;

import java.util.*;
import java.util.stream.Collectors;

@Repository
public class UserDAOImpl implements UserDAO {

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> allUsers() {
        Session session = sessionFactory.getCurrentSession();
        List<User> games = session.createQuery("from User").getResultList();
        List<User> sortedUsers = games.stream()
                .sorted(Comparator.comparing(User::getRatingUser).reversed())
                .collect(Collectors.toList());
        return sortedUsers;
    }

    @Override
    public void add(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(user);
    }

    @Override
    public void delete(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(user);
    }

    @Override
    public void edit(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.update(user);
    }

    @Override
    @SuppressWarnings("unchecked")
    public User getById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User where id = :id");
        query.setParameter("id", id);
        return ((List<User>) query.getResultList()).get(0);
    }

    @Override
    public void registration(String lastName, String firstName, String emailAddress, String password, String passwordConfirm, int ratingUser) {

    }

    @Override
    public void authentication(String emailAddress, String password) {

    }

    @Override
    @SuppressWarnings("unchecked")
    public String verifyRegistration(User user) {
        String message = "";
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User where emailAddress = :emailAddress");
        query.setParameter("emailAddress", user.getEmailAddress());
        if(((List<User>) query.getResultList()).isEmpty()) {
            Query queryInsert = session.createQuery("insert into User (lastName, firstName, emailAddress, password, passwordConfirm, ratingUser) values (:lastName, :firstName, :emailAddress, :password, :passwordConfirm, :ratingUser)");
            queryInsert.setParameter("lastName", user.getLastName());
            queryInsert.setParameter("firstName", user.getFirstName());
            queryInsert.setParameter("emailAddress", user.getEmailAddress());
            queryInsert.setParameter("password", user.getPassword());
            queryInsert.setParameter("passwordConfirm", user.getPasswordConfirm());
            queryInsert.setParameter("ratingUser", user.getRatingUser());
            queryInsert.executeUpdate();
            message = "OK";
        }else{
            message = "User with this email address already exists";
        }
        return message;
    }

    @Override
    @SuppressWarnings("unchecked")
    public String verifyAuthentication(User user) {
        String message = "";
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User where emailAddress = :emailAddress and password = :password");
        query.setParameter("emailAddress", user.getEmailAddress());
        query.setParameter("password", user.getPassword());
        if(((List<User>) query.getResultList()).isEmpty()) {
            message = "Incorrect email address or password";
        }else{
            message = "OK";
        }
        return message;
    }

    @Override
    @SuppressWarnings("unchecked")
    public String forgotPassword(User user) {
        String message = "";
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User where emailAddress = :emailAddress");
        query.setParameter("emailAddress", user.getEmailAddress());
        if(((List<User>) query.getResultList()).isEmpty()) {
            message = "This email address does not exist";
        }else{
            message = "OK";
        }
        return message;
    }

}