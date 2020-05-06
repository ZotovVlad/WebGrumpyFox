package webgrumpyfox.webgrumpyfox.service;

import webgrumpyfox.webgrumpyfox.model.Game;

import java.util.List;

public interface GameService {
    List<Game> allGames();
    void add(Game game);
    void delete(Game game);
    void edit(Game game);
    Game getById(int id);
}