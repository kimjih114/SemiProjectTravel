/*
 * package common;
 * 
 * import java.util.List;
 * 
 * import board.model.service.Board_QuestionService; import
 * board.model.vo.Board_Question;
 * 
 * public class QuestionBoardListSingletone {
 * 
 * private static QuestionBoardListSingletone instance; private
 * List<Board_Question> qboardList;
 * 
 * private QuestionBoardListSingletone() {
 * 
 * qboardList = new Board_QuestionService().selectBoardQuestionList();
 * 
 * 
 * } public static QuestionBoardListSingletone getInstance() {
 * 
 * if(instance == null) instance = new QuestionBoardListSingletone();
 * 
 * return instance;
 * 
 * } public List<Board_Question> getQboardList(){
 * 
 * return qboardList; }
 * 
 * 
 * }
 */