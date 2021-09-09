/*
package webgrumpyfox.webgrumpyfox.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import webgrumpyfox.webgrumpyfox.model.AjaxResponseBody;
import webgrumpyfox.webgrumpyfox.model.Game;
import webgrumpyfox.webgrumpyfox.service.GameService;

import java.util.ArrayList;
import java.util.List;

@Controller
public class GameController {

    private final GameService gameService;

    public GameController(GameService gameService) {
        this.gameService = gameService;
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

    @RequestMapping(value = "/rate_games", method = RequestMethod.GET)
    public ModelAndView allGames() {
        List<Game> games = gameService.allGames();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/rate_games");
        modelAndView.addObject("gamesList", games);
        return modelAndView;
    }

    @RequestMapping(value = "/menu", method = RequestMethod.GET)
    public ModelAndView gamesMenu() {
        List<Game> games = gameService.allGames();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/menu");
        modelAndView.addObject("gamesList", games);
        return modelAndView;
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

}
*/
