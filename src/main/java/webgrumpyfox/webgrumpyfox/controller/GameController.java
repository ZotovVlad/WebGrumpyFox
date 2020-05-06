package webgrumpyfox.webgrumpyfox.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import webgrumpyfox.webgrumpyfox.model.AjaxResponseBody;
import webgrumpyfox.webgrumpyfox.model.Game;
import webgrumpyfox.webgrumpyfox.model.User;
import webgrumpyfox.webgrumpyfox.service.GameService;
import webgrumpyfox.webgrumpyfox.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class GameController {

    private final GameService gameService;

    public GameController(GameService gameService) {
        this.gameService = gameService;
    }

    @ResponseBody
    @RequestMapping(value = "/rating/getRatingResult")
    public AjaxResponseBody getSearchResultViaAjax(@RequestBody Game game) {

        AjaxResponseBody result = new AjaxResponseBody();

        if (!game.getName().equals("")) {
            result.setCode("200");
            result.setMsg("");
            result.setResult(game.getName());
        } else {
            result.setCode("204");
            result.setMsg("No game!");
        }

        return result;

    }

}