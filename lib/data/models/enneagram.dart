class Enneagram {
  int enneagramType;
  String name;
  String shortDescription;
  String imageUrl;

  Enneagram(
      {required this.enneagramType,
      required this.name,
      required this.shortDescription,
      required this.imageUrl});

  String getName() {
    return '$name($enneagramType유형)';
  }
}

final Map<int, Enneagram> enneagramMap = {
  0 : Enneagram(enneagramType: 0,name: '', shortDescription: '테스트가 필요합니다.', imageUrl: 'assets/images/enneagram/pawprint.png'),
  1 : Enneagram(enneagramType: 1,name: '소', shortDescription: '표현력이 있고, 극적이며, 자기 내면에 빠져 있으며, 변덕스럽다.', imageUrl: 'assets/images/enneagram/cow.png'),
  2 : Enneagram(enneagramType: 2,name: '강아지', shortDescription: '표현력이 있고, 극적이며, 자기 내면에 빠져 있으며, 변덕스럽다.', imageUrl: 'assets/images/enneagram/dog.png'),
  3 : Enneagram(enneagramType: 3,name: '독수리', shortDescription: '표현력이 있고, 극적이며, 자기 내면에 빠져 있으며, 변덕스럽다.', imageUrl: 'assets/images/enneagram/eagle.png'),
  4 : Enneagram(enneagramType: 4,name: '고양이', shortDescription: '표현력이 있고, 극적이며, 자기 내면에 빠져 있으며, 변덕스럽다.', imageUrl: 'assets/images/enneagram/cat.png'),
  5 : Enneagram(enneagramType: 5,name: '부엉이', shortDescription: '표현력이 있고, 극적이며, 자기 내면에 빠져 있으며, 변덕스럽다.', imageUrl: 'assets/images/enneagram/owl.png'),
  6 : Enneagram(enneagramType: 6,name: '사슴', shortDescription: '표현력이 있고, 극적이며, 자기 내면에 빠져 있으며, 변덕스럽다.', imageUrl: 'assets/images/enneagram/deer.png'),
  7 : Enneagram(enneagramType: 7,name: '원숭이', shortDescription: '표현력이 있고, 극적이며, 자기 내면에 빠져 있으며, 변덕스럽다.', imageUrl: 'assets/images/enneagram/monkey.png'),
  8 : Enneagram(enneagramType: 8,name: '호랑이', shortDescription: '표현력이 있고, 극적이며, 자기 내면에 빠져 있으며, 변덕스럽다.', imageUrl: 'assets/images/enneagram/tiger.png'),
  9 : Enneagram(enneagramType: 9,name: '코끼리', shortDescription: '표현력이 있고, 극적이며, 자기 내면에 빠져 있으며, 변덕스럽다.', imageUrl: 'assets/images/enneagram/elephant.png'),
};