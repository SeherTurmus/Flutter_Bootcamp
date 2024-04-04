import 'package:makeup_page/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHigh = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    var texts = AppLocalizations.of(context);

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: pageColor2,
            centerTitle: true,
            title: Text(
              texts!.appBarText,
              style: TextStyle(
                  fontFamily: 'ProtestRevolution',
                  fontSize: screenWidth/13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: textColor3),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.coffee_sharp,
                  color: textColor1,
                ),
                onPressed: () {},
              )
            ],
          ),
          backgroundColor: pageColor3,
          body: Padding(
            padding: EdgeInsets.all(screenHigh/45),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.lime,
                  backgroundImage: AssetImage('pictures/kahve.jpg'),
                ),
                Text(
                  texts.caffeLatteText,
                  style: TextStyle(
                      fontFamily: 'ProtestRevolution',
                      fontSize: screenHigh/25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                      color: pageColor4),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ContentInfo(content: texts.sugarText),
                    ContentInfo(content: texts.creamText),
                    ContentInfo(content: texts.aromaText),
                  ],
                ),
                SizedBox(
                  width: screenWidth,
                  child: Divider(
                    height: screenHigh/40,
                    color: pageColor4,
                  ),
                ),
                Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(onPressed: (){},
                      style: TextButton.styleFrom(
                          backgroundColor: pageColor2,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                      ),
                      child: Text(texts.smallText,
                        style: TextStyle(color: textColor1, fontSize: screenWidth/23),textAlign: TextAlign.center,),
                    ),
                    TextButton(onPressed: (){},
                      style: TextButton.styleFrom(
                          backgroundColor: pageColor2,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                      ),
                      child: Text(texts.mediumText, style: TextStyle(color: textColor1, fontSize: screenWidth/23),textAlign: TextAlign.center,),

                    ),
                    TextButton(onPressed: (){},
                      style: TextButton.styleFrom(
                          backgroundColor: pageColor2,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                      ),
                      child: Text(texts.largeText, style: TextStyle(color: textColor1, fontSize: screenWidth/23),textAlign: TextAlign.center,),

                    ),
                  ],
                ),
                Column(
                      children: [
                        Row(
                          children: [
                            const CheckboxExample(),
                            Contents(content: texts.fullFatText),
                          ],
                        ),
                        Row(
                          children: [
                            const CheckboxExample(),
                            Contents(content: texts.lowFatText),
                          ],
                        ),
                        Row(
                          children: [
                            const CheckboxExample(),
                            Contents(content: texts.lactoseFreeText)
                          ],
                        ),
                      ],
                    ),
                Text(texts.descriptionText,
                  style: TextStyle(fontSize: screenWidth/25, color: textColor1),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        texts.priceText, style: TextStyle(
                        fontSize: screenWidth/12,
                        fontWeight: FontWeight.bold,
                        color: textColor1
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox( width: screenWidth/2,
                      child: TextButton(onPressed: (){},
                        style: TextButton.styleFrom(
                          backgroundColor: pageColor2,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                        ),
                        child: Text(texts.addToCartText,
                          style: TextStyle(
                          fontSize: screenWidth/21, color: textColor1
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool? isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      tristate: true,
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (!states.contains(MaterialState.selected)) {
          return pageColor4;
        }
        return pageColor4;
      }),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value;
        });
      },
    );
  }
}

class Contents extends StatelessWidget {
  final String content;
  const Contents({super.key, required this.content});
  
  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic),
      textAlign: TextAlign.start,
    );
  }
}

class ContentInfo extends StatelessWidget {
  final String content;
  const ContentInfo({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: pageColor4,
        fontSize: 17,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.75,
      ),
    );
  }
}
