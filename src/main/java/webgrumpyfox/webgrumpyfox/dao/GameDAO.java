package webgrumpyfox.webgrumpyfox.dao;
import webgrumpyfox.webgrumpyfox.model.Game;

import java.util.List;

public interface GameDAO {
    List<Game> allGames();
    void add(Game game);
    void delete(Game game);
    void edit(Game game);
    Game getById(int id);

    int gamesCount();
}