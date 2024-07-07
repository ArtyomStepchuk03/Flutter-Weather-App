import 'package:flutter/material.dart';

/// Старница с данными о погоде на календаре.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Image.asset('assets/images/ava.jpg'),
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Гауптмашинлернингштурмфюрер',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const Expanded(
          flex: 3,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Text(
              'Приветствую в моём приложении!'
              ' Меня зовут Степчук Артём. Являюсь разработчиком приложений'
              ' для мобильных устройств и desktop.'
              ' Ну и ML ещё на Python штурмую.\n'
              ' Занимаюсь мобильной разработкой около 3 лет.'
              ' Из них 2 года я самостоятельно изучал Java и'
              ' писал приложения на этом чудесном языке.'
              ' Код этих приложений сокрыт, дабы не навредить'
              ' моей репутации. Опыт работы с Flutter - около года.'
              ' Обычно меня перекидывали с одного стека на другой,'
              ' поэтому могу что-то подзабыть, но пока писал'
              ' это приложение, не заметил каких-либо сложностей.\n'
              'Мне очень нравится моя работа, и, разумеется,'
              ' я заинтересован в развитии, поэтому готов осваивать'
              ' новые технологии и прогрессировать в текущем стеке.\n'
              'Спасибо за внимание!',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.justify,
            ),
          ),
        )
      ],
    );
  }
}
