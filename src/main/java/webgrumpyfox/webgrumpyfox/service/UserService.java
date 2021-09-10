package webgrumpyfox.webgrumpyfox.service;

import webgrumpyfox.webgrumpyfox.model.User;

import java.util.List;

public interface UserService {
    List<User> allUsers();
    void add(User user);
    void delete(User user);
    void edit(User user);
    User getById(int id);

    void registration(User user);
    User authentication(String emailAddress, String password);
    String verifyRegistration(User user);
    String verifyAuthentication(User user);
    String forgotPassword(User user);
}