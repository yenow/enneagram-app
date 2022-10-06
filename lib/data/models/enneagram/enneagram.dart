class Enneagram {
  int enneagramType;
  String name;
  String subName;
  String firstDescription;
  String secondDescription;
  String imageUrl;

  Enneagram(
      {required this.enneagramType,
      required this.name,
      required this.subName,
      required this.firstDescription,
      required this.secondDescription,
      required this.imageUrl});

  String getName() {

    return '$name($enneagramType유형)';
  }
}

final Map<int, Enneagram> enneagramMap = {
  0: Enneagram(
      enneagramType: 0,
      name: '없음',
      subName: '없음',
      firstDescription: '테스트가 필요합니다.',
      secondDescription: '테스트가 필요합니다.',
      imageUrl: 'assets/images/enneagram/pawprint.png'),
  1: Enneagram(
      enneagramType: 1,
      name: '소',
      subName: '개혁가',
      firstDescription: '이상적이고 이상적인 유형',
      secondDescription: '원칙적이고, 목표가 분명하며, 자신을 잘 통제하고, 완벽주의 기질이 있다.',
      imageUrl: 'assets/images/enneagram/cow.png'),
  2: Enneagram(
      enneagramType: 2,
      name: '강아지',
      subName: '돕는 사람',
      firstDescription: '사람들을 잘 돌보고 그들과 교류하기를 즐기는 유형',
      secondDescription: '자신의 감정을 잘 드러내며, 사람들을 즐겁게 해 주고, 관대하며, 소유욕이 강하다.',
      imageUrl: 'assets/images/enneagram/dog.png'),
  3: Enneagram(
      enneagramType: 3,
      name: '독수리',
      subName: '성취하는 사람',
      firstDescription: '성공지향적이며 실용적인 유형',
      secondDescription: '적응을 잘하고, 뛰어나며, 자신의 이미지에 관심이 많다.',
      imageUrl: 'assets/images/enneagram/eagle.png'),
  4: Enneagram(
      enneagramType: 4,
      name: '고양이',
      subName: '예술가',
      firstDescription: '민감하며 안으로 움츠러드는 유형',
      secondDescription: '표현력이 있고, 극적이며, 자기 내면에 빠져 있으며, 변덕스럽다.',
      imageUrl: 'assets/images/enneagram/cat.png'),
  5: Enneagram(
      enneagramType: 5,
      name: '부엉이',
      subName: '탐구자',
      firstDescription: '이성적이고 지혜가 있는 유형',
      secondDescription: '지각력이 있고, 창의적이며, 혼자 있기를 좋아하고, 마음을 잘 드러내지 않는다.',
      imageUrl: 'assets/images/enneagram/owl.png'),
  6: Enneagram(
      enneagramType: 6,
      name: '사슴',
      subName: '충실하고 안전을 추구하는 유형',
      firstDescription: '책임감이 있고, 의심과 불안이 많으며, 사람들에게 맞추려고 한다.',
      secondDescription: '책임감이 있고, 의심과 불안이 많으며, 사람들에게 맞추려고 한다.',
      imageUrl: 'assets/images/enneagram/deer.png'),
  7: Enneagram(
      enneagramType: 7,
      name: '원숭이',
      subName: '열정적인 사람',
      firstDescription: '늘 분주하며 재미를 추구하는 유형',
      secondDescription: '즉흥적이고, 변덕스러우며, 욕심이 많고, 산만하다.',
      imageUrl: 'assets/images/enneagram/monkey.png'),
  8: Enneagram(
      enneagramType: 8,
      name: '호랑이',
      subName: '도전하는 사람',
      firstDescription: '힘이 있으며 남을 지배하는 유형',
      secondDescription: '자신감이 있고, 결단력이 있으며, 고집스럽고, 사람들과 맞서기를 좋아한다.',
      imageUrl: 'assets/images/enneagram/tiger.png'),
  9: Enneagram(
      enneagramType: 9,
      name: '코끼리',
      subName: '평화주의자',
      firstDescription: '느긋하며 남들 앞에 나서지 않는 유형',
      secondDescription: '수용적이며, 자족적이고, 남에게 쉽게 동의하며 위안을 준다.',
      imageUrl: 'assets/images/enneagram/elephant.png'),
};
