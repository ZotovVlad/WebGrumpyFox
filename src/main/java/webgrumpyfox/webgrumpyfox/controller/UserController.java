package webgrumpyfox.webgrumpyfox.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import webgrumpyfox.webgrumpyfox.model.AjaxResponseBody;
import webgrumpyfox.webgrumpyfox.model.User;
import webgrumpyfox.webgrumpyfox.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    private static int i = 0;

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public @ResponseBody int show(HttpServletRequest request, HttpServletResponse response) throws Exception {
        i++;
        return i;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/index");
        return modelAndView;
    }

    @RequestMapping(value = "/menu", method = RequestMethod.GET)
    public ModelAndView menu() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/menu");
        return modelAndView;
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView profile() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/profile");
        return modelAndView;
    }

    @RequestMapping(value = "/rate_games", method = RequestMethod.GET)
    public ModelAndView rate_games() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/rate_games");
        return modelAndView;
    }

    @RequestMapping(value = "/rate_users", method = RequestMethod.GET)
    public ModelAndView rate_users() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/rate_users");

        modelAndView.addObject("getId1", userService.getById(1).getId());
        modelAndView.addObject("getFirstName1", userService.getById(1).getFirstName());
        modelAndView.addObject("getLastName1", userService.getById(1).getLastName());
        modelAndView.addObject("getEmailAddress1", userService.getById(1).getEmailAddress());
        modelAndView.addObject("getPassword1", userService.getById(1).getPassword());

        modelAndView.addObject("getId2", userService.getById(2).getId());
        modelAndView.addObject("getFirstName2", userService.getById(2).getFirstName());
        modelAndView.addObject("getLastName2", userService.getById(2).getLastName());
        modelAndView.addObject("getEmailAddress2", userService.getById(2).getEmailAddress());
        modelAndView.addObject("getPassword2", userService.getById(2).getPassword());

        return modelAndView;
    }

    @RequestMapping(value = "/authentication", method = RequestMethod.POST)
    public ModelAndView authentication(@ModelAttribute("authentication") User user) {
        ModelAndView modelAndView = new ModelAndView();
        String messageVerify = userService.verifyAuthentication(user);
        if(!messageVerify.equals("OK")) {
            if(messageVerify.equals("Incorrect email address or password")){
                modelAndView.addObject("errorSignInAuth", messageVerify);
            }
            if(messageVerify.equals("Incorrect format email address")){
                modelAndView.addObject("errorEmailAddressAuth", messageVerify);
            }
            if(messageVerify.equals("Password must be between 6 and 20 characters")){
                modelAndView.addObject("errorPasswordAuth", messageVerify);
            }
            if(messageVerify.equals("Unknown error")){
                modelAndView.addObject("errorSignInAuth", messageVerify);
            }
            modelAndView.setViewName("/index");
        } else{
            userService.authentication(user.getEmailAddress(), user.getPassword());
            modelAndView.setViewName("/menu");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView registration(@ModelAttribute("registration") User user) {
        ModelAndView modelAndView = new ModelAndView();
        String messageVerify = userService.verifyRegistration(user);
        if(!messageVerify.equals("OK")) {
            if(messageVerify.equals("User with this email address already exists")){
                modelAndView.addObject("errorEmailAddressReg", messageVerify);
            }
            if(messageVerify.equals("Incorrect format email address")){
                modelAndView.addObject("errorEmailAddressReg", messageVerify);
            }
            if(messageVerify.equals("Password must be between 6 and 20 characters")){
                modelAndView.addObject("errorPasswordReg", messageVerify);
            }
            if(messageVerify.equals("Password confirm must be between 6 and 20 characters")){
                modelAndView.addObject("errorPasswordConfirmReg", messageVerify);
            }
            if(messageVerify.equals("Passwords do not match")){
                modelAndView.addObject("errorPasswordReg", messageVerify);
                modelAndView.addObject("errorPasswordConfirmReg", messageVerify);
            }
            if(messageVerify.equals("Unknown error")){
                modelAndView.addObject("errorSignUpReg", messageVerify);
            }
            modelAndView.setViewName("/index");
        } else{
            userService.authentication(user.getEmailAddress(), user.getPassword());
            modelAndView.setViewName("/menu");
        }
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/rating/getRatingResult")
    public AjaxResponseBody getSearchResultViaAjax(@RequestBody User user) {

        AjaxResponseBody result = new AjaxResponseBody();

        if (!user.getLastName().equals("")) {
            result.setCode("200");
            result.setMsg("");
            result.setResult(user.getLastName());
        } else {
            result.setCode("204");
            result.setMsg("No user!");
        }

        return result;

    }

}