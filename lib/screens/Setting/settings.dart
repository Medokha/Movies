import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../provider/provider_settings.dart';
import '../../shared/styles/colors.dart';
import 'mode.dart';
import 'package:provider/provider.dart';
class setting extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<providersettings>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          Text("language",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: DropdownButton(
                underline: SizedBox(),
                  value: pro.dropdownvalue == 'en' ? 'English' : 'Arabic',
                  icon: Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .60),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 22,
                      color: Colors.black,
                    ),
                  ),
                  items: [
                    'English',
                    'Arabic',
                  ].map((String item) {
                    return DropdownMenuItem(
                        value: item,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            item,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ));
                  }).toList(),
                  onChanged: (String? newvalue) {
                    (newvalue == 'English')
                        ? pro.changevalue('en')
                        : pro.changevalue('ar');
                  }),
            ),
          ),
          mode(),
        ],
      ),
    );
  }
}
