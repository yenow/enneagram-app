import 'package:enneagram/data/models/question/question_type.dart';

class Question {
  String question;
  QuestionType questionType;
  int? enneagramType;
  int? score;

  Question(this.question, this.questionType, this.enneagramType);

  @override
  String toString() {
    return 'Question{question: $question, questionType: $questionType, enneagramType: $enneagramType, score: $score}';
  }
}

final detailTest_45Questions = [
  // enneagram type 1
  Question("대부분의 사람들은 나를 진지하고 융통성 없는 사람이라고 생각한다. 실제로 나는 그런 사람이다.", QuestionType.question45, 1),
  Question("나는 항상 내 자신에 대해서 정직하고 객관적이려고 노력한다. 그리고 어떤 대가를 치르든지 내 양심에 따라서 행동한다", QuestionType.question45, 1),
  Question("나에게 거친 부분이 있기는 하지만 그것이 나의 전체적인 성향을 대변해 주는 말은 아니다.", QuestionType.question45, 1),
  Question("내 머릿속에는 심판관이 있어서 나는 그와 함께 살고 있는 것 같다. 어떤 때는 그 심판관이 현명하고 분별력이 있지만  많은 경우에 그는 고집이 세고 가혹하다.", QuestionType.question45, 1),
  Question("나는 완벽해지기 위해서 많은 대가를 치른다고 느낀다.", QuestionType.question45, 1),

  // enneagram type 2
  Question("나는 사람에 대해서 순수한 관심을 갖기 때문에 남들의 희망, 꿈, 필요를 잘 이해하고 있다.", QuestionType.question45, 2),
  Question("사람들에게 친숙한 느낌을 갖는 것은 내게는 아주 자연스럽다. 나는 쉽게 사람들과 대화를 하고 친밀하게 지낸다.", QuestionType.question45, 2),
  Question("내가 사람들에게 관심을 보이고 격려할 때 그들은 나를 따뜻하게 대해 준다.", QuestionType.question45, 2),
  Question("나는 길 잃은 개를 보면 집에 데려다 주고 싶은 생각이 든다.", QuestionType.question45, 2),
  Question("나는 내가 사려 깊고 너그러운 사람이라는 것이 기쁘다.", QuestionType.question45, 2),

  // enneagram type 3
  Question("나는 스스로를 자신감 있는 사람이라고 여긴다. 어떤 일을 효율적으로 하지 못했을 때 나는 마음이 불편하다.", QuestionType.question45, 3),
  Question("어떤 일이 잘 풀려 나갈 때 나는 자신과 삶에 대해서 만족을 느끼며, 내면에서 기쁨이 '솟아나는'것을 느낀다.", QuestionType.question45, 3),
  Question("나는 다른 사람들에게 나의 가장 좋은 모습을 보이려고 노력한다.", QuestionType.question45, 3),
  Question("나는 자신의 감정에 대해서 익숙하지 않다. 잠깐 동안은 감정을 강하게 느끼지만 곧 다른 일에 몰두한다.", QuestionType.question45, 3),
  Question("내가 원하는 성공을 아직 이루지 못했다고 해도, 내가 잘 해 나가고 있다는 것을 느끼는 것은 나에게 아주 중요하다.", QuestionType.question45, 3),

  // enneagram type 4
  Question("많은 사람이 나를 알기 어렵고 모순된 면을 갖고 있는 사람이라고 생각한다. 그리고 나는 나의 그런 면이 좋다.", QuestionType.question45, 4),
  Question("나는 부정적인 감정이 있을 때 오랫동안 그것을 품고 있는 경향이 있다.", QuestionType.question45, 4),
  Question("나는 자신이 혼자이며 외롭다고 느낄 때가 많다. 가까운 사람과 함께 있을 때도 그렇다.", QuestionType.question45, 4),
  Question("사람들이 나를 비판하거나 제대로 이해하지 못할 때 나는 움츠러들고 혼자 뾰로통해 있다.", QuestionType.question45, 4),
  Question("어떤 프로젝트에 임할 때, 내가 창조적인 아이디어를 낼 수 있고 그것이 잘 받아들여지는 상황이 아니라면 그 일에 전념하기가 어렵다.", QuestionType.question45, 4),

  // enneagram type 5
  Question("나는 어떤 문제에 대해서 깊이 파고들기를 좋아한다. 그래서 가능한 한 완전히 그것에 대해서 알아낸다.", QuestionType.question45, 5),
  Question("나는 많은 사람들이 나의 세계로 들어오는 것을 허용하지 않는 극단적으로 사적인 사람이다.", QuestionType.question45, 5),
  Question("나는 스스로가 그리 크거나 강한 사람이라고 느껴지지 않는다. 오히려 작고 눈에 띄지 않는 사람이라고 여겨진다. 내가 스파이가 된다면 그 일을 잘 해낼 것이다!", QuestionType.question45, 5),
  Question("내가 대부분의 시간에 무엇을 생각하는지 안다면 사람들은 내가 미쳤다고 생각할 것이다.", QuestionType.question45, 5),
  Question("나는 정보를 얻어야만 이성적인 결정을 내릴 수 있다고 생각한다. 그런데 대부분의 사람은 그리 이성적이지 않다.", QuestionType.question45, 5),

  // enneagram type 6
  Question("나는 권위에 끌리지만 권위를 별로 신뢰하지는 않는다.", QuestionType.question45, 6),
  Question("나는 아주 감정적이다. 그러나 아주 친한 사람이 아니면 내가 느끼는 것을 거의 드러내지 않는다. 친한 사람에게도 별로 감정을 보여주지 않는다.", QuestionType.question45, 6),
  Question("내가 실수를 했을 때 모든 사람이 나를 공격할까봐 두렵다.", QuestionType.question45, 6),
  Question("나는 스스로 결정을 내려서 일을 하는 것보다는, 사람들이 내게 기대하는 일을 하는게 더 편하게 느껴진다.", QuestionType.question45, 6),
  Question("나는 항상 규칙에 동의하거나 규칙을 따르지는 않는다. 그러나 나는 규칙을 잘 알기를 원한다.", QuestionType.question45, 6),

  // enneagram type 7
  Question("나는 여행하는 것, 여러 가지 음식을 맛보는 것, 사람들을 만나는 경험을 좋아한다. 그런 것들을 할 때 나는 삶이 아주 근사하게 느껴진다.", QuestionType.question45, 7),
  Question("내 달력은 계획으로 가득 차 있다. 나는 이렇게 바쁘게 지내는 것이 좋다.", QuestionType.question45, 7),
  Question("나에게 중요한 것은 편안함과 안전보다는 흥미진진함과 다양성이다.", QuestionType.question45, 7),
  Question("내 마음 속에는 항상 여러 가지 생각이 있다. 어떤 때는 동시에 열 가지를 생각하는 것 같다.", QuestionType.question45, 7),
  Question("내가 가장 견딜 수 없는 것은 지루함이다. 나는 결코 지루한 적이 없다.", QuestionType.question45, 7),

  // enneagram type 8
  Question("나는 아주 독립적이다. 나는 남에게 의존하는 것을 좋아하지 않는다.", QuestionType.question45, 8),
  Question("나는 뭔가를 이루려면 희생이 뒤따라야 한다고 생각한다.", QuestionType.question45, 8),
  Question("내가 누군가에게 관심을 가지게 되면, 그들을 '나의 사람들'이라고 느낀다. 그래서 그들을 돌봐 주어야 한다고 느낀다.", QuestionType.question45, 8),
  Question("나는 어떻게 결과에 도달할 수 있는지 알고 있다. 어떻게 사람들을 격려하고 어떻게 일을 하도록 압력을 가해야 하는지도 알고 있다.", QuestionType.question45, 8),
  Question("나는 약하고 우유부단한 사람들에 대한 동정심이 별로 없다. 약함은 문제를 일으킬 뿐이다.", QuestionType.question45, 8),

  // enneagram type 9
  Question("나와 있으면 안전하다고 느끼기 때문에 사람들이 나를 좋아하는 것 같다.", QuestionType.question45, 9),
  Question("나는 혼자 있을 때도 괜찮고 사람들과 어울려 있을 때도 괜찮다. 내 마음만 편하다면 어느 쪽도 괜찮다.", QuestionType.question45, 9),
  Question("나는 삶에서 균형을 찾았다. 그리고 나에게는 그 상태를 깰 이유가 없다.", QuestionType.question45, 9),
  Question("모든 면에서 '편안해진다'는 것은 나에게 많은 의미가 있다.", QuestionType.question45, 9),
  Question("나는 앞에 나서는 것을 좋아하지 않는다.", QuestionType.question45, 9),
];

final detailTest_81Questions = [
  // enneagram type 1
  Question("대부분의 사람들은 나를 진지하고 융통성 없는 사람이라고 생각한다. 실제로 나는 그런 사람이다.", QuestionType.question81, 1),
  Question("나는 항상 내 자신에 대해서 정직하고 객관적이려고 노력한다. 그리고 어떤 대가를 치르든지 내 양심에 따라서 행동한다", QuestionType.question81, 1),
  Question("나에게 거친 부분이 있기는 하지만 그것이 나의 전체적인 성향을 대변해 주는 말은 아니다.", QuestionType.question81, 1),
  Question("내 머릿속에는 심판관이 있어서 나는 그와 함께 살고 있는 것 같다. 어떤 때는 그 심판관이 현명하고 분별력이 있지만  많은 경우에 그는 고집이 세고 가혹하다.", QuestionType.question81, 1),
  Question("나는 완벽해지기 위해서 많은 대가를 치른다고 느낀다.", QuestionType.question81, 1),
  Question("나도 남들처럼 웃기를 좋아한다. 사실 나는 더 자주 웃어야 한다.", QuestionType.question81, 1),
  Question("나의 원칙과 이상은 더 큰 성취를 위해서 노력하도록 나를 고무한다. 그리고 그것은 나의 삶을 의미 있고 가치 있는 것으로 만든다.", QuestionType.question81, 1),
  Question("나는 왜 많은 사람들이 낮은 성취동기를 가지고 있는지 이해하지 못하겠다.", QuestionType.question81, 1),
  Question("나는 많은 책임을 지고 있기 때문에 다른 사람보다 더 조직적이고 체계적이어야 한다.", QuestionType.question135, 1),

  // enneagram type 2
  Question("나는 사람에 대해서 순수한 관심을 갖기 때문에 남들의 희망, 꿈, 필요를 잘 이해하고 있다.", QuestionType.question81, 2),
  Question("사람들에게 친숙한 느낌을 갖는 것은 내게는 아주 자연스럽다. 나는 쉽게 사람들과 대화를 하고 친밀하게 지낸다.", QuestionType.question81, 2),
  Question("내가 사람들에게 관심을 보이고 격려할 때 그들은 나를 따뜻하게 대해 준다.", QuestionType.question81, 2),
  Question("나는 길 잃은 개를 보면 집에 데려다 주고 싶은 생각이 든다.", QuestionType.question81, 2),
  Question("나는 내가 사려 깊고 너그러운 사람이라는 것이 기쁘다.", QuestionType.question81, 2),
  Question("나는 사람들을 위해 많은 일을 한 것에 대해서 자랑하기를 좋아하지 않는다. 그러나 사람들이 그것을 알아차리지 못하고 무신경할 때 나는 큰 실망을 느낀다.", QuestionType.question81, 2),
  Question("나는 자신보다 다른 사람을 위해 더 많은 일을 한다. 나는 남에게는 너무 많이 주고 자신에 대해서는 충분히 배려하지 않는다.", QuestionType.question81, 2),
  Question("나는 사람들이 내 편이 되도록 하기 위해서 노력할 때가 있다. 특히 처음에 나에게 무관심한 것 같은 사람들에게는 그렇다.", QuestionType.question81, 2),
  Question("나는 친구들을 즐겁게 해주고 대접하는 것에서 각별한 보람을 느낀다.", QuestionType.question81, 2),

  // enneagram type 3
  Question("나는 스스로를 자신감 있는 사람이라고 여긴다. 어떤 일을 효율적으로 하지 못했을 때 나는 마음이 불편하다.", QuestionType.question81, 3),
  Question("어떤 일이 잘 풀려 나갈 때 나는 자신과 삶에 대해서 만족을 느끼며, 내면에서 기쁨이 '솟아나는'것을 느낀다.", QuestionType.question81, 3),
  Question("나는 다른 사람들에게 나의 가장 좋은 모습을 보이려고 노력한다.", QuestionType.question81, 3),
  Question("나는 자신의 감정에 대해서 익숙하지 않다. 잠깐 동안은 감정을 강하게 느끼지만 곧 다른 일에 몰두한다.", QuestionType.question81, 3),
  Question("내가 원하는 성공을 아직 이루지 못했다고 해도, 내가 잘 해 나가고 있다는 것을 느끼는 것은 나에게 아주 중요하다.", QuestionType.question81, 3),
  Question("나는 불안감을 감추는 데 아주 능숙하다. 사람들은 내가 정말로 무엇을 느끼는지 모를 것이다.", QuestionType.question81, 3),
  Question("나는 사람들에게 좋은 인상을 주려고 노력한다. 그래서 나는 예의바르고 친절하게 행동한다.", QuestionType.question81, 3),
  Question("나는 내 친구나 동료들이 어떻게 해 나가고 있는지를 알고 있다. 나는 그들과 나를 자주 비교한다", QuestionType.question81, 3),
  Question("나는 맡은 일에서 최선을 다하려고 노력한다. 하지만 어떤 일을 뛰어나게 잘 하지 못했다고 해서 그 사실이 나를 괴롭히지는 않는다.", QuestionType.question81, 3),

  // enneagram type 4
  Question("많은 사람이 나를 알기 어렵고 모순된 면을 갖고 있는 사람이라고 생각한다. 그리고 나는 나의 그런 면이 좋다.", QuestionType.question81, 4),
  Question("나는 부정적인 감정이 있을 때 오랫동안 그것을 품고 있는 경향이 있다.", QuestionType.question81, 4),
  Question("나는 자신이 혼자이며 외롭다고 느낄 때가 많다. 가까운 사람과 함께 있을 때도 그렇다.", QuestionType.question81, 4),
  Question("사람들이 나를 비판하거나 제대로 이해하지 못할 때 나는 움츠러들고 혼자 뾰로통해 있다.", QuestionType.question81, 4),
  Question("어떤 프로젝트에 임할 때, 내가 창조적인 아이디어를 낼 수 있고 그것이 잘 받아들여지는 상황이 아니라면 그 일에 전념하기가 어렵다.", QuestionType.question81, 4),
  Question("나는 규칙이나 다른 사람의 기대에 잘 따르지 않으려는 경향이 있다. 나만의 특별한 감정으로 모든 일을 하기를 원하기 때문이다.", QuestionType.question81, 4),
  Question("나는 감정의 변화가 많다.", QuestionType.question81, 4),
  Question("나는 별로 일어날 가망이 없는 일을 상상할 때가 많다.", QuestionType.question81, 4),
  Question("나는 누군가가 나를 구원하여 모든 혼란스러운 상황에서 벗어나게 되기를 꿈꾼다.", QuestionType.question81, 4),

  // enneagram type 5
  Question("나는 어떤 문제에 대해서 깊이 파고들기를 좋아한다. 그래서 가능한 한 완전히 그것에 대해서 알아낸다.", QuestionType.question81, 5),
  Question("나는 많은 사람들이 나의 세계로 들어오는 것을 허용하지 않는 극단적으로 사적인 사람이다.", QuestionType.question81, 5),
  Question("나는 스스로가 그리 크거나 강한 사람이라고 느껴지지 않는다. 오히려 작고 눈에 띄지 않는 사람이라고 여겨진다. 내가 스파이가 된다면 그 일을 잘 해낼 것이다!", QuestionType.question81, 5),
  Question("내가 대부분의 시간에 무엇을 생각하는지 안다면 사람들은 내가 미쳤다고 생각할 것이다.", QuestionType.question81, 5),
  Question("나는 정보를 얻어야만 이성적인 결정을 내릴 수 있다고 생각한다. 그런데 대부분의 사람은 그리 이성적이지 않다.", QuestionType.question81, 5),
  Question("가족들은 내가 좀 이상하거나 특이하다고 생각한다. 그들은 나에게 밖으로 좀 더 많이 나가야 한다고 이야기한다.", QuestionType.question81, 5),
  Question("나도 필요하다면 의견을 말할 수 있다. 그러나 대개는 주변에서 일어나는 일들을 지켜보는 것을 더 좋아한다.", QuestionType.question81, 5),
  Question("나는 문제를 해결해야 할 상황에서는 혼자 일하는 것을 더 좋아한다.", QuestionType.question81, 5),
  Question("나를 잘 살펴본다면 이상한 행동보다는 정상적인 행동을 더 많이 발견할 것이다.", QuestionType.question81, 5),

  // enneagram type 6
  Question("나는 권위에 끌리지만 권위를 별로 신뢰하지는 않는다.", QuestionType.question81, 6),
  Question("나는 아주 감정적이다. 그러나 아주 친한 사람이 아니면 내가 느끼는 것을 거의 드러내지 않는다. 친한 사람에게도 별로 감정을 보여주지 않는다.", QuestionType.question81, 6),
  Question("내가 실수를 했을 때 모든 사람이 나를 공격할까봐 두렵다.", QuestionType.question81, 6),
  Question("나는 스스로 결정을 내려서 일을 하는 것보다는, 사람들이 내게 기대하는 일을 하는게 더 편하게 느껴진다.", QuestionType.question81, 6),
  Question("나는 항상 규칙에 동의하거나 규칙을 따르지는 않는다. 그러나 나는 규칙을 잘 알기를 원한다.", QuestionType.question81, 6),
  Question("나는 사람들에 대해 내가 가졌던 첫 인상을 바꾸기가 어렵다.", QuestionType.question81, 6),
  Question("내가 존경하는 인물이 몇 명 있다. 그들은 나의 영웅이다.", QuestionType.question81, 6),
  Question("나는 결정을 내리는 것을 좋아하지 않는다. 그러나 다른 사람이 내 일을 결정해 주는 것도 좋아하지 않는다.", QuestionType.question81, 6),
  Question("사람들은 내가 좀 초조하고 예민하다고 생각하지만, 나는 그들이 생각하는 것 이상으로 초조하며 예민하다.", QuestionType.question81, 6),

  // enneagram type 7
  Question("나는 여행하는 것, 여러 가지 음식을 맛보는 것, 사람들을 만나는 경험을 좋아한다. 그런 것들을 할 때 나는 삶이 아주 근사하게 느껴진다.", QuestionType.question81, 7),
  Question("내 달력은 계획으로 가득 차 있다. 나는 이렇게 바쁘게 지내는 것이 좋다.", QuestionType.question81, 7),
  Question("나에게 중요한 것은 편안함과 안전보다는 흥미진진함과 다양성이다.", QuestionType.question81, 7),
  Question("내 마음 속에는 항상 여러 가지 생각이 있다. 어떤 때는 동시에 열 가지를 생각하는 것 같다.", QuestionType.question81, 7),
  Question("내가 가장 견딜 수 없는 것은 지루함이다. 나는 결코 지루한 적이 없다.", QuestionType.question81, 7),
  Question("나는 어떤 사람과 관계를 맺고 있을 때 상대에게 꽤 충실한 편이다. 그러나 그 관계가 끝나면 곧 잊어버린다.", QuestionType.question81, 7),
  Question("나는 호기심과 모험심이 많다. 그래서 무엇이든지 흥미롭고 새로운 것을 시도하기를 좋아한다.", QuestionType.question81, 7),
  Question("나는 어떤 일이 더 이상 재미있게 느껴지지 않으면 그 일을 그만둬 버린다.", QuestionType.question81, 7),
  Question("나는 단지 '재미있는' 사람만은 아니다. 별로 달갑지는 않지만 나에게도 심각하고 어두운 면이 있다.", QuestionType.question81, 7),

  // enneagram type 8
  Question("나는 아주 독립적이다. 나는 남에게 의존하는 것을 좋아하지 않는다.", QuestionType.question81, 8),
  Question("나는 뭔가를 이루려면 희생이 뒤따라야 한다고 생각한다.", QuestionType.question81, 8),
  Question("내가 누군가에게 관심을 가지게 되면, 그들을 '나의 사람들'이라고 느낀다. 그래서 그들을 돌봐 주어야 한다고 느낀다.", QuestionType.question81, 8),
  Question("나는 어떻게 결과에 도달할 수 있는지 알고 있다. 어떻게 사람들을 격려하고 어떻게 일을 하도록 압력을 가해야 하는지도 알고 있다.", QuestionType.question81, 8),
  Question("나는 약하고 우유부단한 사람들에 대한 동정심이 별로 없다. 약함은 문제를 일으킬 뿐이다.", QuestionType.question81, 8),
  Question("나는 의지가 강한 사람이다. 그래서 쉽게 포기하거나 주저않지 않는다.", QuestionType.question81, 8),
  Question("내 영향력 아래에 있고 내가 감싸 주던 사람이 독립적으로 자기 일을 해 나갈 때 나는 아주 긴장을 하고 그를 지켜본다.", QuestionType.question81, 8),
  Question("나에게도 부드럽고 감상적인 면이 있지만 아주 소수의 사람들에게만 그런 모습을 보여준다.", QuestionType.question81, 8),
  Question("나를 아는 사람들은 내가 직선적으로 마음을 표현하는 것을 좋아한다.", QuestionType.question81, 8),

  // enneagram type 9
  Question("나와 있으면 안전하다고 느끼기 때문에 사람들이 나를 좋아하는 것 같다.", QuestionType.question81, 9),
  Question("나는 혼자 있을 때도 괜찮고 사람들과 어울려 있을 때도 괜찮다. 내 마음만 편하다면 어느 쪽도 괜찮다.", QuestionType.question81, 9),
  Question("나는 삶에서 균형을 찾았다. 그리고 나에게는 그 상태를 깰 이유가 없다.", QuestionType.question81, 9),
  Question("모든 면에서 '편안해진다'는 것은 나에게 많은 의미가 있다.", QuestionType.question81, 9),
  Question("나는 앞에 나서는 것을 좋아하지 않는다.", QuestionType.question81, 9),
  Question("나는 내 뜻대로 조작하기보다는 일이 흘러가는 대로 내버려 두는 편이다.", QuestionType.question81, 9),
  Question("나는 쉽게 만족하는 편이다. 나는 내가 갖고 있는 것이 충분하다고 여긴다.", QuestionType.question81, 9),
  Question("나는 주의가 산만하며 멍하다는 이야기를 듣는다. 사실 나는 상황을 잘 이해하지만 그것에 반응하는 것을 좋아하지 않는다.", QuestionType.question81, 9),
  Question("내가 특별히 고집이 세다고는 생각하지 않는다. 그러나 사람들은 내가 일단 마음 먹으면 누구의 말도 듣지 않는다고 말한다.", QuestionType.question81, 9),
];

final detailTest_135Questions = [

  // enneagram type 1
  Question("대부분의 사람들은 나를 진지하고 융통성 없는 사람이라고 생각한다. 실제로 나는 그런 사람이다.", QuestionType.question135, 1),
  Question("나는 항상 내 자신에 대해서 정직하고 객관적이려고 노력한다. 그리고 어떤 대가를 치르든지 내 양심에 따라서 행동한다", QuestionType.question135, 1),
  Question("나에게 거친 부분이 있기는 하지만 그것이 나의 전체적인 성향을 대변해 주는 말은 아니다.", QuestionType.question135, 1),
  Question("내 머릿속에는 심판관이 있어서 나는 그와 함께 살고 있는 것 같다. 어떤 때는 그 심판관이 현명하고 분별력이 있지만  많은 경우에 그는 고집이 세고 가혹하다.", QuestionType.question135, 1),
  Question("나는 완벽해지기 위해서 많은 대가를 치른다고 느낀다.", QuestionType.question135, 1),
  Question("나도 남들처럼 웃기를 좋아한다. 사실 나는 더 자주 웃어야 한다.", QuestionType.question135, 1),
  Question("나의 원칙과 이상은 더 큰 성취를 위해서 노력하도록 나를 고무한다. 그리고 그것은 나의 삶을 의미 있고 가치 있는 것으로 만든다.", QuestionType.question135, 1),
  Question("나는 왜 많은 사람들이 낮은 성취동기를 가지고 있는지 이해하지 못하겠다.", QuestionType.question135, 1),
  Question("나는 많은 책임을 지고 있기 때문에 다른 사람보다 더 조직적이고 체계적이어야 한다.", QuestionType.question135, 1),
  Question("나는 사명감을 가지고 있다. 나에게는 중대한 소명이 주어졌다. 나는 뭔가 뛰어난 업적을 남겨야 한다고 믿는다.", QuestionType.question135, 1),
  Question("나는 실수하는 것을 아주 싫어한다. 그래서 모든 것이 제대로 되게 하기 위해서 아주 철저하게 일을 하려고 한다.", QuestionType.question135, 1),
  Question("대체로 나는 옳은 것은 옳은 것이고 틀린 것은 틀린 것이라고 믿는다.", QuestionType.question135, 1),
  Question("나는 다른 사람에게 일을 맡겼을 때 간섭하지 않고 그대로 내버려 두기가 어렵다.", QuestionType.question135, 1),
  Question("나에게는 많은 책임이 주어졌다. 내가 어려운 시기에 잘 대처하지 않았다면 무신 일이 벌어졌을지 아무도 모른다.", QuestionType.question135, 1),
  Question("나는 어려운 상황 속에서도 인간의 도리와 자신이 믿는 가치를 포기하지 않는 사람들을 볼 때 깊은 감동을 받는다.", QuestionType.question135, 1),

  // enneagram type 2
  Question("나는 사람에 대해서 순수한 관심을 갖기 때문에 남들의 희망, 꿈, 필요를 잘 이해하고 있다.", QuestionType.question135, 2),
  Question("사람들에게 친숙한 느낌을 갖는 것은 내게는 아주 자연스럽다. 나는 쉽게 사람들과 대화를 하고 친밀하게 지낸다.", QuestionType.question135, 2),
  Question("내가 사람들에게 관심을 보이고 격려할 때 그들은 나를 따뜻하게 대해 준다.", QuestionType.question135, 2),
  Question("나는 길 잃은 개를 보면 집에 데려다 주고 싶은 생각이 든다.", QuestionType.question135, 2),
  Question("나는 내가 사려 깊고 너그러운 사람이라는 것이 기쁘다.", QuestionType.question135, 2),
  Question("나는 사람들을 위해 많은 일을 한 것에 대해서 자랑하기를 좋아하지 않는다. 그러나 사람들이 그것을 알아차리지 못하고 무신경할 때 나는 큰 실망을 느낀다.", QuestionType.question135, 2),
  Question("나는 자신보다 다른 사람을 위해 더 많은 일을 한다. 나는 남에게는 너무 많이 주고 자신에 대해서는 충분히 배려하지 않는다.", QuestionType.question135, 2),
  Question("나는 사람들이 내 편이 되도록 하기 위해서 노력할 때가 있다. 특히 처음에 나에게 무관심한 것 같은 사람들에게는 그렇다.", QuestionType.question135, 2),
  Question("나는 친구들을 즐겁게 해주고 대접하는 것에서 각별한 보람을 느낀다.", QuestionType.question135, 2),
  Question("나는 따뜻하고 사람들에게 도움을 주는 사람이다. 그러나 나에게는 다른 사람이 생각하지 못하는 차가운 면이 있다.", QuestionType.question135, 2),
  Question("나는 다른 사람들보다 나의 감정을 잘 표현할 수 있다.", QuestionType.question135, 2),
  Question("나는 내가 아끼는 사람들에게 무슨 일이 일어나는지 알기 위해 각별한 노력을 기울인다.", QuestionType.question135, 2),
  Question("나는 스스로를 '낙심한 사람을 치유해 주는 사람'이라고 생각한다.", QuestionType.question135, 2),
  Question("나는 나 자신보다는 다른 사람의 필요를 먼저 생각하기 때문에 건강과 재정적인 면에서 어려움을 겪고 있다.", QuestionType.question135, 2),
  Question("나는 다른 사람들을 돌보느라고 기진맥진해질 때가 있다.", QuestionType.question135, 2),

  // enneagram type 3
  Question("나는 스스로를 자신감 있는 사람이라고 여긴다. 어떤 일을 효율적으로 하지 못했을 때 나는 마음이 불편하다.", QuestionType.question135, 3),
  Question("어떤 일이 잘 풀려 나갈 때 나는 자신과 삶에 대해서 만족을 느끼며, 내면에서 기쁨이 '솟아나는'것을 느낀다.", QuestionType.question135, 3),
  Question("나는 다른 사람들에게 나의 가장 좋은 모습을 보이려고 노력한다.", QuestionType.question135, 3),
  Question("나는 자신의 감정에 대해서 익숙하지 않다. 잠깐 동안은 감정을 강하게 느끼지만 곧 다른 일에 몰두한다.", QuestionType.question135, 3),
  Question("내가 원하는 성공을 아직 이루지 못했다고 해도, 내가 잘 해 나가고 있다는 것을 느끼는 것은 나에게 아주 중요하다.", QuestionType.question135, 3),
  Question("나는 불안감을 감추는 데 아주 능숙하다. 사람들은 내가 정말로 무엇을 느끼는지 모를 것이다.", QuestionType.question135, 3),
  Question("나는 사람들에게 좋은 인상을 주려고 노력한다. 그래서 나는 예의바르고 친절하게 행동한다.", QuestionType.question135, 3),
  Question("나는 내 친구나 동료들이 어떻게 해 나가고 있는지를 알고 있다. 나는 그들과 나를 자주 비교한다", QuestionType.question135, 3),
  Question("나는 맡은 일에서 최선을 다하려고 노력한다. 하지만 어떤 일을 뛰어나게 잘 하지 못했다고 해서 그 사실이 나를 괴롭히지는 않는다.", QuestionType.question135, 3),
  Question("나는 목표를 이루기 위해서 원칙을 무시하고 빨리 가는 길을 택할 때가 있다.", QuestionType.question135, 3),
  Question("나는 불안할 때 사람들을 냉정하게 대하고 사람들에게서 떨어져 있다.", QuestionType.question135, 3),
  Question("다른 사람들이 내가 이룬 일을 인정하지 않을 때 마음이 아주 불편하다.", QuestionType.question135, 3),
  Question("나는 보통사람보다 적응을 더 잘한다. 나는 일이 잘 풀리지 않을 때 어떻게 행동을 바꾸면 내가 원하는 결과를 얻을지 안다.", QuestionType.question135, 3),
  Question("나는 항상 목표에 초점을 맞춘다. 그리고 그것을 이루기 위해 나 자신에게 어떻게 동기부여를 해야 하는지를 안다.", QuestionType.question135, 3),
  Question("나는 일 중독에 빠지는 경향이 있다. 어떤 일을 성취하고 있지 않으면 마음이 불안하다.", QuestionType.question135, 3),

  // enneagram type 4
  Question("많은 사람이 나를 알기 어렵고 모순된 면을 갖고 있는 사람이라고 생각한다. 그리고 나는 나의 그런 면이 좋다.", QuestionType.question135, 4),
  Question("나는 부정적인 감정이 있을 때 오랫동안 그것을 품고 있는 경향이 있다.", QuestionType.question135, 4),
  Question("나는 자신이 혼자이며 외롭다고 느낄 때가 많다. 가까운 사람과 함께 있을 때도 그렇다.", QuestionType.question135, 4),
  Question("사람들이 나를 비판하거나 제대로 이해하지 못할 때 나는 움츠러들고 혼자 뾰로통해 있다.", QuestionType.question135, 4),
  Question("어떤 프로젝트에 임할 때, 내가 창조적인 아이디어를 낼 수 있고 그것이 잘 받아들여지는 상황이 아니라면 그 일에 전념하기가 어렵다.", QuestionType.question135, 4),
  Question("나는 규칙이나 다른 사람의 기대에 잘 따르지 않으려는 경향이 있다. 나만의 특별한 감정으로 모든 일을 하기를 원하기 때문이다.", QuestionType.question135, 4),
  Question("나는 감정의 변화가 많다.", QuestionType.question135, 4),
  Question("나는 별로 일어날 가망이 없는 일을 상상할 때가 많다.", QuestionType.question135, 4),
  Question("나는 누군가가 나를 구원하여 모든 혼란스러운 상황에서 벗어나게 되기를 꿈꾼다.", QuestionType.question135, 4),
  Question("상황이 어려워지면 나는 힘없이 무너지고 포기하는 경향이 있다. 나는 너무 쉽게 포기하는 것 같다.", QuestionType.question135, 4),
  Question("나는 형편없는 취향을 가진 사람과 함께 있을 때 견디기가 어렵다.", QuestionType.question135, 4),
  Question("대개의 경우 나는 다른 사람과 너무 가까이 지내며 함께 일하는 것을 좋아하지 않는다.", QuestionType.question135, 4),
  Question("나는 자신에게 집중하며 자신의 감정적 필요를 충족시키는 것을 아주 중요하게 생각한다.", QuestionType.question135, 4),
  Question("나는 남 앞에 서는 것도, 남 의견에 무작정 따르는 것도 좋아하지 않는다.", QuestionType.question135, 4),
  Question("나는 내 직관에 따르든지 따르지 않든지 내가 직관적으로 느끼는 것이 무엇인지 정확하게 알고 있다.", QuestionType.question135, 4),

  // enneagram type 5
  Question("나는 어떤 문제에 대해서 깊이 파고들기를 좋아한다. 그래서 가능한 한 완전히 그것에 대해서 알아낸다.", QuestionType.question135, 5),
  Question("나는 많은 사람들이 나의 세계로 들어오는 것을 허용하지 않는 극단적으로 사적인 사람이다.", QuestionType.question135, 5),
  Question("나는 스스로가 그리 크거나 강한 사람이라고 느껴지지 않는다. 오히려 작고 눈에 띄지 않는 사람이라고 여겨진다. 내가 스파이가 된다면 그 일을 잘 해낼 것이다!", QuestionType.question135, 5),
  Question("내가 대부분의 시간에 무엇을 생각하는지 안다면 사람들은 내가 미쳤다고 생각할 것이다.", QuestionType.question135, 5),
  Question("나는 정보를 얻어야만 이성적인 결정을 내릴 수 있다고 생각한다. 그런데 대부분의 사람은 그리 이성적이지 않다.", QuestionType.question135, 5),
  Question("가족들은 내가 좀 이상하거나 특이하다고 생각한다. 그들은 나에게 밖으로 좀 더 많이 나가야 한다고 이야기한다.", QuestionType.question135, 5),
  Question("나도 필요하다면 의견을 말할 수 있다. 그러나 대개는 주변에서 일어나는 일들을 지켜보는 것을 더 좋아한다.", QuestionType.question135, 5),
  Question("나는 문제를 해결해야 할 상황에서는 혼자 일하는 것을 더 좋아한다.", QuestionType.question135, 5),
  Question("나를 잘 살펴본다면 이상한 행동보다는 정상적인 행동을 더 많이 발견할 것이다.", QuestionType.question135, 5),
  Question("나는 맡은 프로젝트를 다듬는 데 많은 시간을 보내는 경향이 있다.", QuestionType.question135, 5),
  Question("대부분의 사람들은 아주 무지하다. 그런데도 일이 이루어지는 것은 정말 놀라운 일이다.", QuestionType.question135, 5),
  Question("나는 여러 분야에 대해서 많은 것을 알고 있다. 그리고 몇몇 분야에 대해서는 전문가 수준이다.", QuestionType.question135, 5),
  Question("나는 호기심이 많으며, 어떤 일이든 왜 그런 방식으로 이루어지는지 탐구하기를 좋아한다. 나는 극히 단순하고 뻔한 것들도 아주 자세히 들여다본다.", QuestionType.question135, 5),
  Question("나의 생각은 격렬하고 활동적이다.", QuestionType.question135, 5),
  Question("떄때로 나는 하고 있는 일에 너무 열중해서 시간을 잊어버린다.", QuestionType.question135, 5),

  // enneagram type 6
  Question("나는 권위에 끌리지만 권위를 별로 신뢰하지는 않는다.", QuestionType.question135, 6),
  Question("나는 아주 감정적이다. 그러나 아주 친한 사람이 아니면 내가 느끼는 것을 거의 드러내지 않는다. 친한 사람에게도 별로 감정을 보여주지 않는다.", QuestionType.question135, 6),
  Question("내가 실수를 했을 때 모든 사람이 나를 공격할까봐 두렵다.", QuestionType.question135, 6),
  Question("나는 스스로 결정을 내려서 일을 하는 것보다는, 사람들이 내게 기대하는 일을 하는게 더 편하게 느껴진다.", QuestionType.question135, 6),
  Question("나는 항상 규칙에 동의하거나 규칙을 따르지는 않는다. 그러나 나는 규칙을 잘 알기를 원한다.", QuestionType.question135, 6),
  Question("나는 사람들에 대해 내가 가졌던 첫 인상을 바꾸기가 어렵다.", QuestionType.question135, 6),
  Question("내가 존경하는 인물이 몇 명 있다. 그들은 나의 영웅이다.", QuestionType.question135, 6),
  Question("나는 결정을 내리는 것을 좋아하지 않는다. 그러나 다른 사람이 내 일을 결정해 주는 것도 좋아하지 않는다.", QuestionType.question135, 6),
  Question("사람들은 내가 좀 초조하고 예민하다고 생각하지만, 나는 그들이 생각하는 것 이상으로 초조하며 예민하다.", QuestionType.question135, 6),
  Question("나는 자신이 얼마나 엉망인지를 알고 있다. 그래서 다른 사람이 하는 일에 대해서도 의심을 품을 때가 많다.", QuestionType.question135, 6),
  Question("나는 사람들을 신뢰하고 싶다. 그러나 다른 사람들의 동기가 의심스러울 때가 많다.", QuestionType.question135, 6),
  Question("나는 정말로 열심히 일한다. 나는 일이 끝날 때까지 쉬지 않고 계속 일한다.", QuestionType.question135, 6),
  Question("나는 결정을 내리기 전에 내가 신뢰하는 사람들의 의견을 들어본다.", QuestionType.question135, 6),
  Question("나는 모든 일에 대해 회의적이며 냉소적이기까지 하다. 하지만 그러다가도 태도를 완전히 바꾸어 어떤 것이 완전히 몰입해 버리기도 한다. 나 스스로도 이러한 면이 아주 이상하게 느껴진다.", QuestionType.question135, 6),
  Question("나는 불안해 할 때가 아주 많다.", QuestionType.question135, 6),

  // enneagram type 7
  Question("나는 여행하는 것, 여러 가지 음식을 맛보는 것, 사람들을 만나는 경험을 좋아한다. 그런 것들을 할 때 나는 삶이 아주 근사하게 느껴진다.", QuestionType.question135, 7),
  Question("내 달력은 계획으로 가득 차 있다. 나는 이렇게 바쁘게 지내는 것이 좋다.", QuestionType.question135, 7),
  Question("나에게 중요한 것은 편안함과 안전보다는 흥미진진함과 다양성이다.", QuestionType.question135, 7),
  Question("내 마음 속에는 항상 여러 가지 생각이 있다. 어떤 때는 동시에 열 가지를 생각하는 것 같다.", QuestionType.question135, 7),
  Question("내가 가장 견딜 수 없는 것은 지루함이다. 나는 결코 지루한 적이 없다.", QuestionType.question135, 7),
  Question("나는 어떤 사람과 관계를 맺고 있을 때 상대에게 꽤 충실한 편이다. 그러나 그 관계가 끝나면 곧 잊어버린다.", QuestionType.question135, 7),
  Question("나는 호기심과 모험심이 많다. 그래서 무엇이든지 흥미롭고 새로운 것을 시도하기를 좋아한다.", QuestionType.question135, 7),
  Question("나는 어떤 일이 더 이상 재미있게 느껴지지 않으면 그 일을 그만둬 버린다.", QuestionType.question135, 7),
  Question("나는 단지 '재미있는' 사람만은 아니다. 별로 달갑지는 않지만 나에게도 심각하고 어두운 면이 있다.", QuestionType.question135, 7),
  Question("나는 차근차근 실천하기보다는 전체적인 계획을 세우는 것을 더 잘한다. 예를 들어 각자가 창조적인 아이디어를 내놓는 회으를 하는 것이 그 아이디어를 실제로 적용하는 것 보다 더 재미있다.", QuestionType.question135, 7),
  Question("내가 뭔가를 정말로 원할 때는 그것을 손에 넣을 수 있는 방법을 찾는다.", QuestionType.question135, 7),
  Question("나도 이따금 실망에 빠질 때가 있다. 그러나 곧 그런 기분에서 벗어난다.", QuestionType.question135, 7),
  Question("내가 가진 문제 중의 하나는 너무 산만하고 집중을 못한다는 것이다.", QuestionType.question135, 7),
  Question("나는 내 형편에 맞지 않게 돈을 너무 많이 쓴다.", QuestionType.question135, 7),
  Question("내가 가는 곳의 사람들이 기꺼이 따라와 준다면 나는 사람들과 같이 다니는 것이 좋다.", QuestionType.question135, 7),

  // enneagram type 8
  Question("나는 아주 독립적이다. 나는 남에게 의존하는 것을 좋아하지 않는다.", QuestionType.question135, 8),
  Question("나는 뭔가를 이루려면 희생이 뒤따라야 한다고 생각한다.", QuestionType.question135, 8),
  Question("내가 누군가에게 관심을 가지게 되면, 그들을 '나의 사람들'이라고 느낀다. 그래서 그들을 돌봐 주어야 한다고 느낀다.", QuestionType.question135, 8),
  Question("나는 어떻게 결과에 도달할 수 있는지 알고 있다. 어떻게 사람들을 격려하고 어떻게 일을 하도록 압력을 가해야 하는지도 알고 있다.", QuestionType.question135, 8),
  Question("나는 약하고 우유부단한 사람들에 대한 동정심이 별로 없다. 약함은 문제를 일으킬 뿐이다.", QuestionType.question135, 8),
  Question("나는 의지가 강한 사람이다. 그래서 쉽게 포기하거나 주저않지 않는다.", QuestionType.question135, 8),
  Question("내 영향력 아래에 있고 내가 감싸 주던 사람이 독립적으로 자기 일을 해 나갈 때 나는 아주 긴장을 하고 그를 지켜본다.", QuestionType.question135, 8),
  Question("나에게도 부드럽고 감상적인 면이 있지만 아주 소수의 사람들에게만 그런 모습을 보여준다.", QuestionType.question135, 8),
  Question("나를 아는 사람들은 내가 직선적으로 마음을 표현하는 것을 좋아한다.", QuestionType.question135, 8),
  Question("나는 내가 누리는 모든 것을 위해 열심히 일한다. 그리고 나는 어떤 일을 어렵게 이루는 것이 좋다고 느낀다. 이것이 나를 강하게 만들며 내가 원하는 것이 무엇인지 분명하게 알도록 해 주기 때문이다.", QuestionType.question135, 8),
  Question("나는 스스로 도전자라고 생각한다. 나는 사람들을 밀어붙여서 그들이 최선을 다하도록 한다.", QuestionType.question135, 8),
  Question("나의 유머 감각은 현실적이다. 때로는 그것이 거칠기도 하다. 나는 대부분의 사람들이 너무 소심하고 심약하다고 생각한다.", QuestionType.question135, 8),
  Question("나는 크게 화를 낼 때가 있다. 그러나 곧 가라앉는다.", QuestionType.question135, 8),
  Question("나는 다른 사람들이 불가능하다고 느끼는 일을 할 때 가장 많은 힘을 얻는다. 나는 내가 할 수 있는 극한까지 가서 그것을 이룰수 있는지 보고싶다.", QuestionType.question135, 8),
  Question("어떤 상황에서는 누군가 손해를 봐야한다. 그렇지만 나는 그것이 내가 아니었으면 좋겠다.", QuestionType.question135, 8),

  // enneagram type 9
  Question("나와 있으면 안전하다고 느끼기 때문에 사람들이 나를 좋아하는 것 같다.", QuestionType.question135, 9),
  Question("나는 혼자 있을 때도 괜찮고 사람들과 어울려 있을 때도 괜찮다. 내 마음만 편하다면 어느 쪽도 괜찮다.", QuestionType.question135, 9),
  Question("나는 삶에서 균형을 찾았다. 그리고 나에게는 그 상태를 깰 이유가 없다.", QuestionType.question135, 9),
  Question("모든 면에서 '편안해진다'는 것은 나에게 많은 의미가 있다.", QuestionType.question135, 9),
  Question("나는 앞에 나서는 것을 좋아하지 않는다.", QuestionType.question135, 9),
  Question("나는 내 뜻대로 조작하기보다는 일이 흘러가는 대로 내버려 두는 편이다.", QuestionType.question135, 9),
  Question("나는 쉽게 만족하는 편이다. 나는 내가 갖고 있는 것이 충분하다고 여긴다.", QuestionType.question135, 9),
  Question("나는 주의가 산만하며 멍하다는 이야기를 듣는다. 사실 나는 상황을 잘 이해하지만 그것에 반응하는 것을 좋아하지 않는다.", QuestionType.question135, 9),
  Question("내가 특별히 고집이 세다고는 생각하지 않는다. 그러나 사람들은 내가 일단 마음 먹으면 누구의 말도 듣지 않는다고 말한다.", QuestionType.question135, 9),
  Question("대부분의 사람들은 쉽게 흥분한다. 그러나 나는 안정되고 침착한 편이다.", QuestionType.question135, 9),
  Question("우리는 삶에서 일어나는 일을 그저 받아들여야만 한다. 거기에 대해서 별로 할 수 있는 일이 없기 때문이다.", QuestionType.question135, 9),
  Question("나는 다른 사람의 관점을 쉽게 이해할 수 있다. 나는 사람들에게 동의하지 않을 때 보다는 동의할 때가 더 많다.", QuestionType.question135, 9),
  Question("나는 부정적인 것에 머물기보다는 긍정적인 것을 강조한다.", QuestionType.question135, 9),
  Question("나는 어려울 때 지침을 주고 많은 위안을 주는 삶의 철학을 가지고 있다.", QuestionType.question135, 9),
  Question("나는 낮 시간에는 필요한 모든 일을 한다. 그러나 밤이 되면 어떻게 긴장을 풀고 쉬어야 할지를 모른다.", QuestionType.question135, 9),
];