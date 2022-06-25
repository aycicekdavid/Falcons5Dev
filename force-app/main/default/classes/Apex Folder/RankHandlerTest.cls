@isTest
public class RankHandlerTest {
  @isTest
  private static void rankHandlerTest() {
    RankHandler r = new RankHandler();

    string p1 = r.rankPrize(1);
    System.assertEquals('Gold', p1);

    string p2 = r.rankPrize(2);
    System.assertEquals('Silver', p2);

    string p3 = r.rankPrize(3);
    System.assertEquals('Bronze', p3);

    string p4 = r.rankPrize(4);
    System.assertEquals('You are in top 10.', p4);

    string p5 = r.rankPrize(12);
    System.assertEquals('Participation certificate.', p5);
  }

  @isTest
  private static void rankPrizeSwitchTest() {
    RankHandler r = new RankHandler();

    String s = r.rankPrizeSwitch(1);
    System.assertEquals('Gold', s);

    String s1 = r.rankPrizeSwitch(2);
    System.assertEquals('Silver', s1);

    String s2 = r.rankPrizeSwitch(3);
    System.assertEquals('Bronze', s2);

    String s3 = r.rankPrizeSwitch(4);
    System.assertEquals('Top 10', s3);

    String s4 = r.rankPrizeSwitch(15);
    System.assertEquals('Participation certificate', s4);
  }
}
