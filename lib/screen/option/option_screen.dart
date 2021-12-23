import 'package:dream/screen/option/option_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  final iconNext = const Icon(Icons.navigate_next);
  final iconShare = const Icon(Icons.open_in_new);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Option',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _titleBox('1 ToDO', size.height / 10),
            _listTitle(
              onTap: () {},
              textTitle: 'textTitle',
              child: iconNext,
            ),
            _listTitle(
              onTap: () {},
              textTitle: 'textTitle',
              child: iconNext,
            ),
            _listTitle(
              onTap: () {},
              textTitle: 'textTitle',
              child: iconNext,
            ),
            _listTitle(
              onTap: () {},
              textTitle: 'textTitle',
              child: iconNext,
            ),
            _titleBox('2 ToDo', size.height / 10),
            _listTitle(
              onTap: () {},
              textTitle: 'textTitle',
              child: iconNext,
            ),
            _listTitle(
              onTap: () {},
              textTitle: 'textTitle',
              child: iconNext,
            ),
            _listTitle(
              onTap: () {},
              textTitle: 'textTitle',
              child: iconNext,
            ),
            _listTitle(onTap: () {}, textTitle: 'textTitle', child: iconNext),
            _titleBox('3 ToDo', size.height / 10),
            _listTitle(
              onTap: () {},
              textTitle: 'textTitle',
              child: iconNext,
            ),
            _listTitle(
              onTap: () {},
              textTitle: 'textTitle',
              child: switchTitle(),
            ),
            _listTitle(
                textTitle: 'textTitle', child: const Text(''), onTap: () {}),
            _titleBox('3TODO', size.height / 10),
            _listTitle(
                textTitle: 'textTitle', child: switchTitle(), onTap: () {}),
            _titleBox('', size.height / 20),
            _listTitle(
                textTitle: 'textTitle', child: const Text(''), onTap: () {}),
            _listTitleShare('textTitle')
          ],
        ),
      ),
    );
  }
}

Widget _listTitle({
  required String textTitle,
  required Widget child,
  required void Function()? onTap,
}) {
  return Column(
    children: [
      ListTile(
        title: Row(
          children: [
            Text(textTitle),
          ],
        ),
        trailing: child,
        onTap: onTap,
      ),
      const Divider()
    ],
  );
}

Widget _listTitleShare(
  String textTitle,
) {
  return Column(
    children: [
      ListTile(
        title: Row(
          children: [
            Text(textTitle),
            const Icon(
              Icons.open_in_new,
              size: 15,
            )
          ],
        ),
        onTap: () {},
      ),
      const Divider()
    ],
  );
}

Widget _titleBox(String tittle, double _height) {
  return Container(
    alignment: Alignment.bottomLeft,
    decoration: const BoxDecoration(
      color: Colors.greenAccent,
    ),
    height: _height,
    child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        tittle,
        style: const TextStyle(fontSize: 20),
      ),
    ),
  );
}

Widget switchTitle() {
  return Consumer<OptionProvider>(
      builder: (_, model, child) => Switch(
          value: model.isSwitch,
          onChanged: (isNewSwitch) {
            model.setIsSwitch(isNewSwitch: isNewSwitch);
          }));
}
