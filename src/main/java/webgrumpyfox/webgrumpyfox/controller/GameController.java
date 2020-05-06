package webgrumpyfox.webgrumpyfox.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import webgrumpyfox.webgrumpyfox.model.Game;
import webgrumpyfox.webgrumpyfox.service.GameService;

import java.util.List;

@Controller
public class GameController {

    private int page;

    private final GameService gameService;

    public GameController(GameService gameService) {
        this.gameService = gameService;
    }

    @RequestMapping(value = "/game/{id}", method = RequestMethod.GET)
    public ModelAndView editPage(@PathVariable("id") int id) {
        Game game = gameService.getById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/game");
        modelAndView.addObject("gameName", game.getName());
        modelAndView.addObject("gameDescription", game.getDescription());
        modelAndView.addObject("gameAuthor", game.getAuthor());
        modelAndView.addObject("gameRating", game.getRating());
        modelAndView.addObject("gameAwards", game.getAwards());
        return modelAndView;
    }

    @RequestMapping(value = "/rate_games", method = RequestMethod.GET)
    public ModelAndView allGames(@RequestParam(defaultValue = "1") int page) {
        List<Game> games = gameService.allGames(page);
        int gamesCount = gameService.gamesCount();
        int pagesCount = (gamesCount + 9)/10;
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/rate_games");
        modelAndView.addObject("page", page);
        modelAndView.addObject("gamesList", games);
        modelAndView.addObject("gamesCount", gamesCount);
        modelAndView.addObject("pagesCount", pagesCount);
        this.page = page;
        return modelAndView;
    }

}