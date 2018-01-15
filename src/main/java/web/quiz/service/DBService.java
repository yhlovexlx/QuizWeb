package web.quiz.service;
import web.quiz.model.*;

import java.util.List;

public interface DBService{
    public List<Question> loadQuestions();
    public List<Person> loadPersons();
}
