package webgrumpyfox.webgrumpyfox.service;

import webgrumpyfox.webgrumpyfox.model.User;

import java.util.List;

public interface UserService {
    List<User> allUsers();
    void add(User user);
    void delete(User user);
    void edit(User user);
    User getById(int id);

    void registration(String lastName, String firstName, String emailAddress, String password, String passwordConfirm);
    void authentication(String emailAddress, String password);
    String verifyRegistration(User user);
    String verifyAuthentication(User user);
}