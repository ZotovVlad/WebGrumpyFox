package webgrumpyfox.webgrumpyfox.service;

import org.springframework.stereotype.Service;
import webgrumpyfox.webgrumpyfox.dao.GameDAO;
import webgrumpyfox.webgrumpyfox.model.Game;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class GameServiceImpl implements GameService {

    private final GameDAO gameDAO;

    public GameServiceImpl(GameDAO gameDAO) {
        this.gameDAO = gameDAO;
    }

    @Transactional
    public List<Game> allGames() {
        return gameDAO.allGames();
    }

    @Transactional
    public void add(Game game) {
        gameDAO.add(game);
    }

    @Transactional
    public void delete(Game game) {
        gameDAO.delete(game);
    }

    @Transactional
    public void edit(Game game) {
        gameDAO.edit(game);
    }

    @Transactional
    public Game getById(int id) {
        return gameDAO.getById(id);
    }

    @Transactional
    public int gamesCount() {
        return gameDAO.gamesCount();
    }

}