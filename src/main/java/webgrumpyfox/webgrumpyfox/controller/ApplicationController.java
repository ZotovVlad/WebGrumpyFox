package webgrumpyfox.webgrumpyfox.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import webgrumpyfox.webgrumpyfox.model.AjaxResponseBody;
import webgrumpyfox.webgrumpyfox.model.Game;
import webgrumpyfox.webgrumpyfox.model.User;
import webgrumpyfox.webgrumpyfox.service.GameService;
import webgrumpyfox.webgrumpyfox.service.UserService;

import java.util.List;

@Controller
public class ApplicationController {

    private static int scope = 0;

    private final UserService userService;
    private final GameService gameService;

    public ApplicationController(UserService userService, GameService gameService) {
        this.userService = userService;
        this.gameService = gameService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView gamesMenu() {
        int countTopGames = 9;
        List<Game> games = gameService.topGamesByCount(countTopGames);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/index");
        modelAndView.addObject("gamesList", games);
        return modelAndView;
    }

    @RequestMapping(value = "/authentication_registration", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/authentication_registration");
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
            modelAndView.setViewName("/authentication_registration");
        } else{
            User userSession = userService.authentication(user.getEmailAddress(), user.getPassword());
            modelAndView.setViewName("/index");
            modelAndView = new ModelAndView("redirect:/");
            ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
            attr.setAttribute("user", userSession, ++scope);
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
            modelAndView.setViewName("/authentication_registration");
        } else{
            User userSession = userService.registration(user.getLastName(), user.getFirstName(), user.getEmailAddress(), user.getPassword(), user.getPasswordConfirm(), user.getRatingUser());
            modelAndView.setViewName("/index");
            modelAndView = new ModelAndView("redirect:/");
            ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
            attr.setAttribute("user", userSession, ++scope);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/forgot_pass", method = RequestMethod.POST)
    public ModelAndView forgotPass() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/forgot_pass");
        return modelAndView;
    }

    @RequestMapping(value = "/forgot_password", method = RequestMethod.POST)
    public ModelAndView forgotPass(@ModelAttribute("forgot_password") User user) {
        ModelAndView modelAndView = new ModelAndView();
        String messageVerify = userService.forgotPassword(user);
        if(!messageVerify.equals("OK")) {
            if(messageVerify.equals("This email address does not exist")){
                modelAndView.addObject("errorEmailAddressForgot", messageVerify);
            }
            if(messageVerify.equals("Incorrect format email address")){
                modelAndView.addObject("errorEmailAddressForgot", messageVerify);
            }
            if(messageVerify.equals("Unknown error")){
                modelAndView.addObject("errorForgot", messageVerify);
            }
            modelAndView.setViewName("/forgot_pass");
        } else{
            modelAndView.setViewName("/authentication_registration");
            modelAndView = new ModelAndView("redirect:/authentication_registration");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/rate_users", method = RequestMethod.GET)
    public ModelAndView allUsers() {
        List<User> users = userService.allUsers();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/rate_users");
        modelAndView.addObject("usersList", users);
        return modelAndView;
    }

    @RequestMapping(value = "/rate_games", method = RequestMethod.GET)
    public ModelAndView allGames() {
        List<Game> games = gameService.allGames();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/rate_games");
        modelAndView.addObject("gamesList", games);
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

    @ResponseBody
    @RequestMapping(value = "/game/{id}/updateRatingGame", method = RequestMethod.GET)
    public AjaxResponseBody updateRatingGame(@PathVariable("id") int id) {
        Game game = gameService.getById(id);
        AjaxResponseBody result = new AjaxResponseBody();
        result.setCode("200");
        result.setMsg("");
        result.setResult(Integer.toString(game.getRating()));
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/updateRatingGames", method = RequestMethod.GET)
    public AjaxResponseBody updateRatingGames() {
        String string = "";
        for (int i = 0; i < gameService.gamesCount(); i++) {
            string += Integer.toString(gameService.getById(i + 1).getRating()) + ",";
        }
        AjaxResponseBody result = new AjaxResponseBody();
        result.setCode("200");
        result.setMsg("");
        result.setResult(string);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/game/{id}/likeGame", method = RequestMethod.POST)
    public AjaxResponseBody likeGame(@PathVariable("id") int id) {
        Game game = gameService.getById(id);
        game.setRating(game.getRating() + 1);
        gameService.edit(game);
        AjaxResponseBody result = new AjaxResponseBody();
        result.setCode("200");
        result.setMsg("");
        result.setResult(Integer.toString(game.getRating()));
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/game/{id}/dislikeGame", method = RequestMethod.POST)
    public AjaxResponseBody dislikeGame(@PathVariable("id") int id) {
        Game game = gameService.getById(id);
        game.setRating(game.getRating() - 1);
        gameService.edit(game);
        AjaxResponseBody result = new AjaxResponseBody();
        result.setCode("200");
        result.setMsg("");
        result.setResult(Integer.toString(game.getRating()));
        return result;
    }

    @RequestMapping(value = "/game/{id}", method = RequestMethod.GET)
    public ModelAndView game(@PathVariable("id") int id) {
        Game game = gameService.getById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/game");
        modelAndView.addObject("gameId", game.getId());
        modelAndView.addObject("gameName", game.getName());
        modelAndView.addObject("gameDescription", game.getDescription());
        modelAndView.addObject("gameAuthor", game.getAuthor());
        modelAndView.addObject("gameRating", game.getRating());
        modelAndView.addObject("gameAwards", game.getAwards());
        return modelAndView;
    }

    @RequestMapping(value = "/profileEdit", method = RequestMethod.POST)
    public ModelAndView profileEdit(@ModelAttribute("profileEdit") User user) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        ModelAndView modelAndView = new ModelAndView("redirect:/profile");
        modelAndView.setViewName("/profile");
        User userEdit = (User) attr.getAttribute("user", 1);
        userService.edit(userEdit);
        return modelAndView;
    }



}
