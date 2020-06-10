package webgrumpyfox.webgrumpyfox.service;

import org.springframework.stereotype.Service;
import webgrumpyfox.webgrumpyfox.dao.UserDAO;
import webgrumpyfox.webgrumpyfox.model.User;

import javax.transaction.Transactional;
import java.util.List;
import java.util.regex.Pattern;

@Service
public class UserServiceImpl implements UserService {

    private final UserDAO userDAO;

    public UserServiceImpl(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Transactional
    public List<User> allUsers() {
        return userDAO.allUsers();
    }

    @Transactional
    public void add(User user) {
        userDAO.add(user);
    }

    @Transactional
    public void delete(User user) {
        userDAO.delete(user);
    }

    @Transactional
    public void edit(User user) {
        userDAO.edit(user);
    }

    @Transactional
    public User getById(int id) {
        return userDAO.getById(id);
    }

    @Transactional
    public User registration(String lastName, String firstName, String emailAddress, String password, String passwordConfirm, int ratingUser) {
        return userDAO.registration(lastName, firstName, emailAddress, password, passwordConfirm, ratingUser);
    }

    @Transactional
    public User authentication(String emailAddress, String password) {
        return userDAO.authentication(emailAddress, password);
    }

    @Transactional
    public String verifyRegistration(User user) {
        String regex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        Pattern pattern = Pattern.compile(regex);
        if ((pattern.matcher(user.getEmailAddress()).matches()) &&
                (user.getPassword().length() >= 6 && user.getPassword().length() <= 20) &&
                (user.getPasswordConfirm().length() >= 6 && user.getPasswordConfirm().length() <= 20) &&
                user.getPassword().equals(user.getPasswordConfirm())) {
            return userDAO.verifyRegistration(user);
        } else {
            if (!pattern.matcher(user.getEmailAddress()).matches()) {
                return "Incorrect format email address";
            }
            if (user.getPassword().length() < 6 || user.getPassword().length() > 20) {
                return "Password must be between 6 and 20 characters";
            }
            if (user.getPasswordConfirm().length() < 6 || user.getPasswordConfirm().length() > 20) {
                return "Password confirm must be between 6 and 20 characters";
            }
            if (user.getPassword().equals(user.getPasswordConfirm())) {
                return "Passwords do not match";
            }
        }
        return "Unknown error";
    }


    @Transactional
    public String verifyAuthentication(User user) {
        String regex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        Pattern pattern = Pattern.compile(regex);
        if ((pattern.matcher(user.getEmailAddress()).matches()) && (user.getPassword().length() >= 6 && user.getPassword().length() <= 20)) {
            return userDAO.verifyAuthentication(user);
        } else {
            if (!pattern.matcher(user.getEmailAddress()).matches()) {
                return "Incorrect format email address";
            }
            if (user.getPassword().length() < 6 || user.getPassword().length() > 20) {
                return "Password must be between 6 and 20 characters";
            }
        }
        return "Unknown error";
    }

    @Transactional
    public String forgotPassword(User user) {
        String regex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        Pattern pattern = Pattern.compile(regex);
        if (pattern.matcher(user.getEmailAddress()).matches()) {
            return userDAO.forgotPassword(user);
        } else {
            if (!pattern.matcher(user.getEmailAddress()).matches()) {
                return "Incorrect format email address";
            }
        }
        return "Unknown error";
    }

}